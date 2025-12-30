class CustomerOrder < ApplicationRecord
  belongs_to :customer
  has_many :customer_order_items
  has_one :customer_shipping_detail
end