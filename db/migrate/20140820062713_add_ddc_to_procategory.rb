class AddDdcToProcategory < ActiveRecord::Migration
  def change
    add_column :procategories, :ddc, :string
  end
end
