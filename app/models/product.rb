class Product < ApplicationRecord
  belongs_to :category
  has_many :customer_order_items
  has_many :customer_orders, through: :customer_order_items
end

