json.array!(@users) do |user|
  json.extract! user, :id, :name, :picture_url, :email, :password, :phone, :dob, :event_id
  json.url user_url(user, format: :json)
end
