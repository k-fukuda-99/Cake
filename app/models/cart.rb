class Cart < ApplicationRecord
   belongs_to :item, optional: true
   belongs_to :customer, optional: true

   validates :amount, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

   def sub_total
    (product.price * amount * 1.1).floor
   end

   def self.cart_products_total_price(cart)
    array = []
    carts.each do |cart|
      array << cart.product.price * cart.amount
    end
      return (array.sum * 1.1).floor
   end
end