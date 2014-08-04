ActiveAdmin.register Project do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :procategory, :title, :share, :status, :description, :price, :user
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  index do
    column :title
    column :price
    column "Category" do |p|
      p.procategory.name
    end
    column "Share" do |p|
      if p.share
        link_to image_tag('../assets/unlock.png'), admin_change_share_path(:id => p.id),
          title: "Click to lock " + p.title, rel: 'tooltip'
      else
        link_to image_tag('../assets/lock.png'), admin_change_share_path(:id => p.id),
          title: "Click to unlock " + p.title, rel: 'tooltip'
      end
    end
    column :status

    actions

  end

  controller do
    def change_share
      @project = Project.find(params[:id])
      if @project.share
        @project.share = false
      else
        @project.share = true
      end
      @project.save

      respond_to do |format|
        format.html { redirect_to "/admin/projects" }
      end
    end
  end
end
