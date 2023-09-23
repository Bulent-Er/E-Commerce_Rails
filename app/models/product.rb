class Product < ApplicationRecord
  # dosyayı locale kaydediyor
  has_one_attached :product_image
end
