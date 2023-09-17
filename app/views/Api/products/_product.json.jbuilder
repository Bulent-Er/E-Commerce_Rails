json.extract! product, :id, :name, :description, :quantity, :price, :created_at, :updated_at
json.url api_product_url(product, format: :json)
