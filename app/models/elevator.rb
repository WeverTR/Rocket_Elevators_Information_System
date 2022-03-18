class Elevator < ApplicationRecord
    belongs_to :column
    belongs_to :building, optional: true
end
