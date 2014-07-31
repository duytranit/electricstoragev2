ActiveAdmin.register User do


  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :email, :status
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
    column 'Status' do |staff|
      if staff.status
        label_tag 'Active'
      else
        label_tag 'Suspend'
      end
    end
    column :role
    column 'Actions' do |user|
      link_to('View', admin_user_path(user)) + " | " +     
      link_to('Edit', edit_admin_user_path(user)) + " | " +
      link_to('Delete', admin_user_path(user), :confirm => 'Are you sure?', :method => :delete) + " | " +
      if user.status
        link_to('Suspend', admin_change_status_path(:id => user.id)) 
      else
        link_to('Active', admin_change_status_path(:id => user.id)) 
      end
    end
  end

  form do |f|
    f.inputs "User detail" do
      f.input :email
      f.input :status, as: :select, collection: [["Active", 1],["Suspend", 0]]
    end
    f.actions
  end

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
