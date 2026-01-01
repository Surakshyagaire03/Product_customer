class CustomerOrderItem < ApplicationRecord
  belongs_to :customer_order
  belongs_to :product

  # Validations
  validates :customer_order, :product, presence: true
  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }

  # Callbacks
  after_create :reduce_product_stock

  # Scopes
  scope :large_quantity, -> { where("quantity > 5") }

  private

  def reduce_product_stock
    if product && product.stock >= quantity
      product.update(stock: product.stock - quantity)
    end
  end
end
