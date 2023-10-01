json.message "#{@poduct.name} has been successfully updated"
json.categories do
  json.id @category.id
  json.name @category.name
  json.description @category.description
end