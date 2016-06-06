json.array!(@b_messages) do |b_message|
  json.extract! b_message, :id, :text
  json.url b_message_url(b_message, format: :json)
end
