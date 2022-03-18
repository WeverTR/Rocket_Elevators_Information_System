class Address < ApplicationRecord
    belongs_to :customer, optional: true
    has_many :building
end
