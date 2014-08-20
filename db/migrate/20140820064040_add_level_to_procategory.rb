class AddLevelToProcategory < ActiveRecord::Migration
  def change
    add_column :procategories, :level, :string
    add_column :procategories, :integer, :string, default: 0
  end
end
