json.categories @categories&.each do |category|
  json.id category.id
  json.name category.name
  json.description category.description
end

if @cached_data.present?
  json.categories @cached_data&.each do |category|
    json.id category.id
    json.name category.name
    json.description category.description
  end
  json.message "Cashed data for products"
else 
  json.categories @category&.each do |category|
    json.id category.id
    json.name category.name
    json.description category.description
  end
end