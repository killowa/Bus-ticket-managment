class Trip < ApplicationRecord
    has_and_belongs_to_many :buses #has and belongs to many
    has_and_belongs_to_many :students
    has_many :tickets
end
