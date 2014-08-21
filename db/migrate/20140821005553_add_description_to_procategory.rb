class AddDescriptionToProcategory < ActiveRecord::Migration
  def change
    add_column :procategories, :description, :text
  end
end
