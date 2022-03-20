class Employee < ApplicationRecord
  belongs_to :user, optional: true
end
