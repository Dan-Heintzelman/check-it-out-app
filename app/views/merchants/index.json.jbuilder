json.array!(@merchants) do |merchant|
  json.extract! merchant, :id, :business_name, :checked_in, :tax
  json.url merchant_url(merchant, format: :json)
end
