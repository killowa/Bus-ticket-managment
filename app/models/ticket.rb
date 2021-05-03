class Ticket < ApplicationRecord
  belongs_to :student
  belongs_to :trip
end
