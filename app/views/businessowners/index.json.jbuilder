json.array!(@businessowners) do |businessowner|
  json.extract! businessowner, :id, :company_name, :email, :password, :company_website, :phone, :event_id
  json.url businessowner_url(businessowner, format: :json)
end
