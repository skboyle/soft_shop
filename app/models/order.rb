class Order < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :tickets
  has_one :billing_address
  has_one :shipping_address
  has_many :software_keys

  validates :order_number, presence: true
end
