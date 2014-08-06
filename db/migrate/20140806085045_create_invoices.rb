class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :user_id
      t.text :content
      t.text :note
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
