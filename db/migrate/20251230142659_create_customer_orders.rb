# app/models/customer_order.rb
class CustomerOrder < ApplicationRecord
  belongs_to :customer
  has_many :order_items
  has_one :customer_shipping_detail
end
