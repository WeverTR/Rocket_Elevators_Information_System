class Address < ApplicationRecord
    has_one :customer
    has_many :buildings
end
