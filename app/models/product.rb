class Product < ApplicationRecord
  # dosyayı locale kaydediyor
  has_one_attached :product_image

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :description, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  after_create :send_notification_mail

  def send_notification_mail
    p "The pruduct has been created successfully".center(100, "<=>") 
  end
end
