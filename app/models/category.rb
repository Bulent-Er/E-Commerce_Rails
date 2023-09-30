class Category < ApplicationRecord
  before_save :before_save_for_category
  after_save :after_save_for_category

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :description, presence: true, length: { minimum: 2, maximum: 200 }

  has_many :products


end

private
def before_save_for_category
  # byebug
  p "before_save_for_category run".center(200, "-***")
  # byebug
end

def after_save_for_category
  # byebug
  p "after_save_for_category run".center(200, "-***")
  # byebug
end