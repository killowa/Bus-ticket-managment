class Bus < ApplicationRecord
  validates :capacity, presence: true
  has_and_belongs_to_many :trips
end
