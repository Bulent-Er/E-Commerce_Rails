if @cached_data.present?
  json.categories do
    json.id @cached_data.id
    json.name @cached_data.name
    json.description @cached_data.description
  end
  json.message "Cashed data for Category"
else 
  json.categories do
    json.id @category.id
    json.name @category.name
    json.description @category.description
  end
end