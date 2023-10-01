# json.product @product,  :id, :name, :description, :quantity, :price, :category_id
# json.image rails_blob_url(@product.product_image) if @product.product_image.present?
json.message "#{@product.name.titleize} has been successfully updated"
json.product do
  json.id @product.id
  json.name @product.name
  json.description @product.description
  json.quantity @product.quantity
  json.price @product.price
  json.category_id @product.category_id
  json.image  rails_blob_url(@product.product_image) if @product.product_image.present?
end
