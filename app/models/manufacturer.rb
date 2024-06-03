class Manufacturer < ApplicationRecord
    has_many :products

    # has_many_attached :images
    has_one_attached :logo
  
    validates :endpoint, :contact_name, :contact_email, presence: true
  end