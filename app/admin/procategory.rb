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
    column :status

    actions
  end

  form do |f|
    f.inputs "Project Category Detail" do
      f.input :name
      f.input :status, as: :select, collection: [["Active", 1],["Suspend", 0]]
    end
    f.actions
  end

end
