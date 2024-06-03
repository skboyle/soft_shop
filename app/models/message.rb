class Message < ApplicationRecord
  belongs_to :ticket
  has_and_belongs_to_many :users

  validates :content, presence: true
end
