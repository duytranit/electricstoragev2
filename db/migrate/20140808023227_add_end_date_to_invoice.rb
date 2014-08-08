class AddEndDateToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :end_date, :datetime
  end
end
