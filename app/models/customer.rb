class Customer < ApplicationRecord
    belongs_to :user
    belongs_to :quote, optional: true
    has_one :building
end
