class Trip < ApplicationRecord
    has_many :buses
    has_many :tickets
end
