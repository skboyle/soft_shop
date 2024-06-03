class ShippingAddress < ApplicationRecord
  belongs_to :user
  belongs_to :order

  validates :first_name, :last_name, :address_line_one, :state, :zip_code, :country, presence: true
end
