json.array!(@invoices) do |invoice|
  json.extract! invoice, :id, :user_id, :content, :note, :status
  json.url invoice_url(invoice, format: :json)
end
