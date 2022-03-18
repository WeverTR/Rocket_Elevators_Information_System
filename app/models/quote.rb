class Quote < ApplicationRecord
    belongs_to :customer, optional: true
    belongs_to :lead, optional: true
end
