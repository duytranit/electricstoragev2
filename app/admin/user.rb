ActiveAdmin.register User do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :email, :status, :first_name, :last_name
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end

  index do
    column :email    
    column :role
    column 'Status' do |staff|
      if staff.status
        link_to( image_tag("../assets/yes.png"), admin_change_status_path(:id => staff.id),
          title: "Click to suspend " + staff.email, rel: "tooltip")
      else
        link_to( image_tag("../assets/no.png"), admin_change_status_path(:id => staff.id),
          title: "Click to active " + staff.email, rel: "tooltip")
      end
    end
    actions
  end

  form do |f|
    f.inputs "User detail" do
      f.input :first_name
      f.input :last_name
      f.input :status
    end
    f.actions
  end

  filter :first_name
  filter :last_name
  filter :created_at
  filter :status  

  controller do
    def change_status
      @user = User.find(params[:id])
      if @user.status
        @user.status = false
      else
        @user.status = true
      end
      @user.save
      respond_to do |format|
        format.html { redirect_to "/admin/users" }
      end
    end
  end

end
