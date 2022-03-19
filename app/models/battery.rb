class Battery < ApplicationRecord
    belongs_to :employee, optional: true
    belongs_to :building, optional: true
    has_many :column
end
