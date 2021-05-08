class Student < User
  has_and_belongs_to_many :trips
  has_one :ticket
end
