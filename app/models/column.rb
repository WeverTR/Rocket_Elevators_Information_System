class Column < ApplicationRecord
    belongs_to :battery
    belongs_to :building, optional: true
    belongs_to :customer, optional: true
    has_many :elevator
end
