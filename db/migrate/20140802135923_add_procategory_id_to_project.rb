class AddProcategoryIdToProject < ActiveRecord::Migration
  def change
    add_column :projects, :procategory_id, :integer
  end
end
