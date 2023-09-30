# json.products @products, partial: "api/products/product", as: :product
json.Product @products.each do |product|
  json.name product.name
  json.description product.description
  json.quantity product.quantity
  json.price product.price
  json.category product.category
  json.image rails_blob_url(product.product_image) if product.product_image.present? 
end
