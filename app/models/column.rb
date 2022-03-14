class Column < ApplicationRecord
    belongs_to :building_detail
    has_many :elevator
end
