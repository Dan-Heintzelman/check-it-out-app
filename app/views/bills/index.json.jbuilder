json.array!(@bills) do |bill|
  json.extract! bill, :id, :merchant_name, :seating_id, :total, :paid, :created_at
end
