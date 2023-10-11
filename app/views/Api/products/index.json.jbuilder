if @cached_data.present?
  json.products @cached_data.each do |product|
    json.id  product.id
    json.name product.name
    json.description product.description
    json.quantity product.quantity
    json.price product.price
    json.category product.category_id
    json.image rails_blob_url(product.product_image) if product.product_image.present? 
  end
  json.message "Cashed data for products"
else 
  json.products @product.each do |product|
    json.id  product.id
    json.name product.name
    json.description product.description
    json.quantity product.quantity
    json.price product.price
    json.category product.category_id
    json.image rails_blob_url(product.product_image) if product.product_image.present? 
  end
end
