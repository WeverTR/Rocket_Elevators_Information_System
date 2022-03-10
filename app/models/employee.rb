class Employee < ApplicationRecord
    validates :user_id, :first_name, :last_name, :title,  presence: true
    belongs_to :user
end
