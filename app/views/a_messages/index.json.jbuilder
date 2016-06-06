json.array!(@a_messages) do |a_message|
  json.extract! a_message, :id, :text
  json.url a_message_url(a_message, format: :json)
end
