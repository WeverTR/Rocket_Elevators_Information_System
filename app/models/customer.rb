class Customer < ApplicationRecord
    belongs_to :user
    has_one :building
end
