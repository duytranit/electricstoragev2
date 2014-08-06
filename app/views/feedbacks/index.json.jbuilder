json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :id, :user_id, :project_id, :content, :status
  json.url feedback_url(feedback, format: :json)
end
