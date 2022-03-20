class Battery < ApplicationRecord
    belongs_to :employee, optional: true
    belongs_to :building
    has_many :columns
end
