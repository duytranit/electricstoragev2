class AddLevelToProcategory < ActiveRecord::Migration
  def change
    add_column :procategories, :level, :integer, default: 0
  end
end
