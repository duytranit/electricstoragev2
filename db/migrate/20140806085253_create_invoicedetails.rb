class CreateInvoicedetails < ActiveRecord::Migration
  def change
    create_table :invoicedetails do |t|
      t.integer :invoice_id
      t.integer :project_id
      t.datetime :release_date
      t.datetime :end_date
      t.boolean :status, default: false

      t.timestamps
    end
  end
end
