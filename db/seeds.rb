Category.create(name:"Mobile Phone", description: "Smart")
Category.create(name:"Mobile Phone", description: "Not Smart")
Category.create(name:"Television", description: "65 inch")
Category.create(name:"Television", description: "45 inch")
Category.create(name:"Television", description: "90 inch")
Category.create(name:"Leptop", description: "Home")
Category.create(name:"Leptop", description: "Office")

11.upto(15) do |i|
  Product.create(name: "Iphone", description: "#{i} Pro", price: 100 * i, quantity: i, category_id: 1)
  Product.create(name: "Iphone", description: "#{i} Pro Max", price: 100 * i, quantity: i, category_id: 1)
end

User.create(first_name: "Bülent", last_name: "Er", username: "bropil", email: "bropil@gmail.com", password: "123456", password_confirmation: "123456")
