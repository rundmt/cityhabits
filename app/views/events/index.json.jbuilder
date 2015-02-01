json.array!(@events) do |event|
  json.extract! event, :id, :name, :venue, :city, :description
  json.url event_url(event, format: :json)
end
