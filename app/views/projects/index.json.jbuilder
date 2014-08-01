json.array!(@projects) do |project|
  json.extract! project, :id, :title, :description, :price, :share, :status, :email
  json.url project_url(project, format: :json)
end
