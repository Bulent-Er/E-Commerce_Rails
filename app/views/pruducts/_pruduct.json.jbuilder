json.extract! pruduct, :id, :name, :description, :quantity, :price, :created_at, :updated_at
json.url pruduct_url(pruduct, format: :json)
