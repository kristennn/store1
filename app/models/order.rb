class Order < ApplicationRecord
  before_create :generate_token
  validates_presence_of :billing_name, :billing_address, :shipping_name, :shipping_address
  has_many :product_lists
  belongs_to :user

  def generate_token
    self.token = SecureRandom.uuid
  end

  def pay!
    self.update_columns(is_paid: true)
  end

  def set_payment_with!(method)
    self.update_columns(payment_method: method )
  end

end
