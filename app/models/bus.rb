class Bus < ApplicationRecord
  has_and_belongs_to_many :trips
end
