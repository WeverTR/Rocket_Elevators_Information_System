class Battery < ApplicationRecord
    belongs_to :employee
    belongs_to :building
    has_many :columns
end
