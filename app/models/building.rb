class Building < ApplicationRecord
    belongs_to :customer, optional: true
    has_one :building_detail
end
