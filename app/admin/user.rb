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
    column t("active_admin.user.email") do |user|
      user.email
    end    
    column t("active_admin.user.role") do |user|
      t("active_admin.user."+user.role)
    end
    column t("active_admin.user.status") do |staff|
      if staff.status
        link_to( image_tag("../assets/yes.png"), admin_change_user_status_path(:id => staff.id),
          title: "Click to suspend " + staff.email, rel: "tooltip")
      else
        link_to( image_tag("../assets/no.png"), admin_change_user_status_path(:id => staff.id),
          title: "Click to active " + staff.email, rel: "tooltip")
      end
    end
    actions
  end

  show do
    attributes_table do
      row t("active_admin.user.full_name") do |user|
        user.first_name + " " + user.last_name
      end
      row t("active_admin.user.email") do |user|
        user.email
      end
      row t("active_admin.user.sign_in_count") do |user|
        user.sign_in_count
      end
      row t("active_admin.user.current_sign_in_at") do |user|
        user.current_sign_in_at
      end
      row t("active_admin.user.current_sign_in_ip") do |user|
        user.current_sign_in_ip
      end
      row t("active_admin.user.created_at") do |user|
        user.created_at
      end
      row t("active_admin.user.updated_at") do |user|
        user.updated_at
      end
      row t("active_admin.user.status") do |user|
        if user.status
          image_tag("../assets/yes.png")
        else
          image_tag("../assets/no.png")
        end
      end
      row t("active_admin.user.role") do |user|
        if user.role == 'customer'
          t("active_admin.user.customer")
        else
          t("active_admin.user.staff")
        end
      end
    end
  end

  form :partial => "form"

  filter :first_name
  filter :last_name
  filter :created_at
  filter :status  

  controller do
    def change_user_status
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

    def permitted_params
      params.permit user: [:email, :password, :password_confirmation, :first_name, :last_name, :role, :status]
    end
  end

end
