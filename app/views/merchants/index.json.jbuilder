json.array!(@merchants) do |merchant|
  json.extract! merchant, :id, :business_name, :checked_in
  json.url merchant_url(merchant, format: :json)
end
