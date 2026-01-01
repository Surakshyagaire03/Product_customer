class CustomerOrder < ApplicationRecord
  belongs_to :customer
  has_many :customer_order_items
  has_one :customer_shipping_detail

  # Validations
  validates :customer, presence: true
  validates :total, numericality: { greater_than_or_equal_to: 0 }

  # Callbacks
  after_create :log_creation

  # Scopes
  scope :recent, -> { order(created_at: :desc) }
  scope :high_value, -> { where("total > 1000") }

  private

  def log_creation
    puts "Order ##{id} for Customer #{customer.name} created!"
  end
end
