json.array!(@replies) do |reply|
  json.extract! reply, :id, :content, :status, :feedback_id
  json.url reply_url(reply, format: :json)
end
