class RemoveEndDateFromInvoicedetails < ActiveRecord::Migration
  def change
    remove_column :invoicedetails, :end_date, :datetime
  end
end
