class Ticket < ApplicationRecord
  belongs_to :order
  has_many :messages

  validates :status, :awaiting_response, :notes, :resolution, presence: true
end
