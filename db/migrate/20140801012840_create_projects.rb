class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title, default: "no name"
      t.text :description
      t.decimal :price, precision: 8, scale: 2, default: 0.00
      t.boolean :share, default: false
      t.boolean :status, default: false
      t.string :email

      t.timestamps
    end
  end
end
