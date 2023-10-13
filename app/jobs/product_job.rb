class ProductJob < ApplicationJob
  queue_as :default

  def perform(product)
    if !product.nil?
      product.delete 

      p "test"
    end
  end
end