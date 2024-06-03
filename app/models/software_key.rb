class SoftwareKey < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :order

  validates :key, presence: true, uniqueness: true
end
