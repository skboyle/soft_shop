class Promotion < ApplicationRecord
    has_many :products
  
    validates :start_date, :end_date, :discount_amount, presence: true
  end
  