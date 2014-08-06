ActiveAdmin.register Feedback do


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
    column "Project" do |feedback|
      label_tag truncate(feedback.project.title, length: 30)
    end

    column "Content" do |feedback|
      label_tag truncate(strip_tags(feedback.content), length:50)
    end

    column 'Status' do |feedback|
      if feedback.status
        link_to( image_tag("../assets/yes.png"), admin_change_feedback_status_path(:id => feedback.id),
          title: "Click to suspend " + feedback.project.title, rel: "tooltip")
      else
        link_to( image_tag("../assets/no.png"), admin_change_feedback_status_path(:id => feedback.id),
          title: "Click to active " + feedback.project.title, rel: "tooltip")
      end
    end

    actions
  end

  controller do
    def change_feedback_status
      @feedback = Feedback.find(params[:id])
      if @feedback.status
        @feedback.status = false
      else
        @feedback.status = true
      end
      @feedback.save
      respond_to do |format|
        format.html { redirect_to "/admin/feedbacks" }
      end
    end
  end

end
