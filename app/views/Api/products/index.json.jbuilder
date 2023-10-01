json.products @products.each do |product|
  json.id  product.id
  json.name product.name
  json.description product.description
  json.quantity product.quantity
  json.price product.price
  json.category product.category_id
  json.image rails_blob_url(product.product_image) if product.product_image.present? 
end
