class CustomerShippingDetail < ApplicationRecord
  belongs_to :customer_order
end