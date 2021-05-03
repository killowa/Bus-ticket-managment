class Student < ApplicationRecord
  has_many :trips
  has_one :ticket
end
