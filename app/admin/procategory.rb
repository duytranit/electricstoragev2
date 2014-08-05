ActiveAdmin.register Procategory do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :status
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  index do
    column :name
    column 'Status' do |category|
      if category.status
        link_to( image_tag("../assets/yes.png"), admin_change_procategory_status_path(:id => category.id),
          title: "Click to suspend " + category.name, rel: "tooltip")
      else
        link_to( image_tag("../assets/no.png"), admin_change_procategory_status_path(:id => category.id),
          title: "Click to active " + category.name, rel: "tooltip")
      end
    end

    actions
  end

  form do |f|
    f.inputs "Project Category Detail" do
      f.input :name
      f.input :status, as: :select, collection: [["Active", 1],["Suspend", 0]]
    end
    f.actions
  end

  filter :user, as: :select, :collection => User.all.map(&:email)
  filter :projects
  filter :name
  filter :status
  filter :created_at
  filter :updated_at

  controller do
    def change_procategory_status
      @procategory = Procategory.find(params[:id])
      if @procategory.status
        @procategory.status = false
      else
        @procategory.status = true
      end
      @procategory.save
      respond_to do |format|
        format.html { redirect_to "/admin/procategories" }
      end
    end
  end

end
