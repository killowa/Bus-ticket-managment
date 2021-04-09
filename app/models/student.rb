class Student < ApplicationRecord
  belongs_to :trip, optional: true
  has_one :ticket
end
