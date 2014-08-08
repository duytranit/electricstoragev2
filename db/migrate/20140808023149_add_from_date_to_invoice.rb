class AddFromDateToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :from_date, :datetime
  end
end
