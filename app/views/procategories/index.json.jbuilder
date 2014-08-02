json.array!(@procategories) do |procategory|
  json.extract! procategory, :id, :name, :status, :user_id
  json.url procategory_url(procategory, format: :json)
end
