class Battery < ApplicationRecord
    belongs_to :building
    has_may :columns
end
