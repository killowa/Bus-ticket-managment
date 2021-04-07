class Trip < ApplicationRecord
    has_many :bus
    has_many :student
end
