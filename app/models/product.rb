class Product < ApplicationRecord
  # dosyayı locale kaydediyor
  has_one_attached :product_image

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :description, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }


end
