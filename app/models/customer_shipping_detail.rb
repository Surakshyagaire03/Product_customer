class CustomerShippingDetail < ApplicationRecord
  belongs_to :customer_order

  # Validations
  validates :address, :city, :postal_code, presence: true

  # Scopes
  scope :by_city, ->(city_name) { where(city: city_name.titleize) }

  # Callbacks
  after_create :log_creation

  private

  def log_creation
    puts "Shipping detail for Order ##{customer_order.id} created!"
  end
end
