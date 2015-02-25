json.array!(@events) do |event|
  json.extract! event, :id, :name, :type, :organizer, :start_time, :end_time, :picture_url, :description, :street_address, :city, :country, :zip, :latitude, :longitude
  json.url event_url(event, format: :json)
end
