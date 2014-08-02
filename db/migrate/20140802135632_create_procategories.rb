class CreateProcategories < ActiveRecord::Migration
  def change
    create_table :procategories do |t|
      t.string :name, default: "no name"
      t.boolean :status, default: false
      t.integer :user_id

      t.timestamps
    end
  end
end
