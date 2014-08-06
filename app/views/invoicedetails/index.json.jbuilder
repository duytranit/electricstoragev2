json.array!(@invoicedetails) do |invoicedetail|
  json.extract! invoicedetail, :id, :invoice_id, :project_id, :release_date, :end_date, :status
  json.url invoicedetail_url(invoicedetail, format: :json)
end
