class Employee < ApplicationRecord
  belongs_to :user
  has_one :battery
end
