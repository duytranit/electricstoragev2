class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, default: "no name"
      t.boolean :share, default: false
      t.boolean :status, default: false
      t.text :description
      t.decimal :price, precision: 8, scale: 2, default: 0.00
      t.integer :user_id

      t.timestamps
    end
  end
end
