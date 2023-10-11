# json.product @product,  :id, :name, :description, :quantity, :price, :category_id
# json.image rails_blob_url(@product.product_image) if @product.product_image.present?




if @cached_data.present?
  json.product do
    json.id @cached_data.id
    json.name @cached_data.name
    json.description @cached_data.description
    json.quantity @cached_data.quantity
    json.price @cached_data.price
    json.category_id @cached_data.category_id
    json.image  rails_blob_url(@cached_data.product_image) if @cached_data.product_image.present?
  end
  json.message "Cashed data for product"

else 
  json.product do
    json.id @product.id
    json.name @product.name
    json.description @product.description
    json.quantity @product.quantity
    json.price @product.price
    json.category_id @product.category_id
    json.image  rails_blob_url(@product.product_image) if @product.product_image.present?
  end
end
