json.array!(@c_messages) do |c_message|
  json.extract! c_message, :id, :text
  json.url c_message_url(c_message, format: :json)
end
