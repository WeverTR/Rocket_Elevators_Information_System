class Building < ApplicationRecord
    belongs_to :customer
    has_one :building_detail
end
