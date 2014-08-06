ActiveAdmin.register Reply do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :content, :status
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  index do
    column "Project" do |reply|
      label_tag reply.feedback.project.title
    end
    column "Customer" do |reply|
      label_tag(reply.feedback.user.first_name + " " + reply.feedback.user.last_name)
    end
    column "Feedback" do |reply|
      label_tag(truncate(strip_tags(reply.feedback.content), length: 30))
    end
    column :created_at
    column "Status" do |reply|
      if reply.status
        link_to image_tag('../assets/yes.png'), admin_change_reply_status_path(:id => reply.id),
          title: "Click to suspend " + truncate(reply.content, length: 20), rel: "tooltip"
      else
        link_to image_tag('../assets/no.png'), admin_change_reply_status_path(:id => reply.id),
          title: "Click to active " + truncate(reply.content, length: 20), rel: "tooltip"
      end
    end
    actions
  end

  controller do
    def change_reply_status
      @replies = Reply.find(params[:id])
      if @replies.status
        @replies.status = false
      else
        @replies.status = true
      end
      @replies.save

      respond_to do |format|
        format.html { redirect_to "/admin/replies" }
      end
    end
  end
end
