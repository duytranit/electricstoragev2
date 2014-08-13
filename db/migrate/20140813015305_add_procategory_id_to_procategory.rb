class AddProcategoryIdToProcategory < ActiveRecord::Migration
  def change
    add_column :procategories, :procategory_id, :integer, default: 0
  end
end
