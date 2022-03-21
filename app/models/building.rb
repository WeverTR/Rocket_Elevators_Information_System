class Building < ApplicationRecord
    belongs_to :customer
    belongs_to :address
    has_many :batteries
    has_one :building_detail
end
