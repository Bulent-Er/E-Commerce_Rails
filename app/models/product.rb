class Product < ApplicationRecord
  # dosyayı locale kaydediyor
  has_one_attached :product_image

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :description, presence: true
  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  validate :custom_validation_method

  after_create :send_notification_mail



  def custom_validation_method
    unless name&.start_with?("A")
      errors.add(:name, 'should start with "A"')
    end
  end

  
  def send_notification_mail
    p "The pruduct has been created successfully".center(100, "<=>") 
  end
end
