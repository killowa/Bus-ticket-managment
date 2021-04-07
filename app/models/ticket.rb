class Ticket < ApplicationRecord
  belongs_to :trip
  belongs_to :student
end
