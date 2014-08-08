class AddDownloadTimeToInvoice < ActiveRecord::Migration
  def change
    add_column :invoices, :download_time, :integer
  end
end
