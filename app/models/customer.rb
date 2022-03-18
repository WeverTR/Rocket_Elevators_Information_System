class Customer < ApplicationRecord
    belongs_to :user
    has_one :quote
    has_one :address
end
