class Bundle < ApplicationRecord
    has_and_belongs_to_many :products
  
    validates :discount_amount, presence: true
  end
  