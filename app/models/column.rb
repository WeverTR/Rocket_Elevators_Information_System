class Column < ApplicationRecord
    belongs_to :battery
    has_many :elevators
end
