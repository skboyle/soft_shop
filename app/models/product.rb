class Product < ApplicationRecord
  belongs_to :manufacturer, optional: true
  has_and_belongs_to_many :carts
  has_and_belongs_to_many :wishlists
  has_and_belongs_to_many :promotions
  has_and_belongs_to_many :bundles
  has_many :software_keys

  has_many_attached :images
  has_many_attached :videos

  validates :title, :category, :product_code, :description, :specifications, :operating_system, :price, :cost, :msrp, presence: true
end
