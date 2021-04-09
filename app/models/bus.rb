class Bus < ApplicationRecord
  belongs_to :trip, optional: true
end
