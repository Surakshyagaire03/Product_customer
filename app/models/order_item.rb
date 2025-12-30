
class OrderItem < ApplicationRecord
  belongs_to :customer_order
  belongs_to :product
end

