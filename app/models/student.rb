class Student < ApplicationRecord
  belongs_to :trip
  has_one :ticket
end
