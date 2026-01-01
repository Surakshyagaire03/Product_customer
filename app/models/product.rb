class Product < ApplicationRecord
  belongs_to :category
  has_many :customer_order_items
  has_many :customer_orders, through: :customer_order_items

  # Default scope
  default_scope { order(name: :asc) }

  # Validations
  validates :name, presence: true, uniqueness: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # Callbacks
  before_save :normalize_name
  after_create :log_creation

  # Scopes
  scope :expensive, -> { where("price > 1000") }

  private

  def normalize_name
    self.name = name.strip.titleize
  end

  def log_creation
    puts "Product #{name} was created!"
  end
end
