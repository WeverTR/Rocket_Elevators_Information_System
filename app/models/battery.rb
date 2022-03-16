class Battery < ApplicationRecord
    belongs_to :building
    has_many :column
end
