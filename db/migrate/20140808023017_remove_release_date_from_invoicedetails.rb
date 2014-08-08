class RemoveReleaseDateFromInvoicedetails < ActiveRecord::Migration
  def change
    remove_column :invoicedetails, :release_date, :datetime
  end
end
