class Customer < ApplicationRecord
  has_many :customer_orders

  # Validations
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, allow_blank: true, format: { with: /\A\d+\z/, message: "only allows numbers" }

  # Callbacks
  before_save :normalize_name_email
  after_create :log_creation

  # Scopes
  scope :with_orders, -> { joins(:customer_orders).distinct }
  scope :recent, -> { order(created_at: :desc) }

  private

  def normalize_name_email
    self.name = name.strip.titleize
    self.email = email.strip.downcase
  end

  def log_creation
    puts "Customer #{name} was created!"
  end
end
