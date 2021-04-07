class Student < ApplicationRecord
  belongs_to :bus
  has_one :ticket
end
