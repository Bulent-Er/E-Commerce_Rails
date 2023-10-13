class Product < ApplicationRecord

  has_one_attached :product_image

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :description, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  after_save :delete_product_after_30days
  
  def delete_product_after_30days
    ProductJob.set(wait: 10.seconds).perform_later(self)
  end

end
