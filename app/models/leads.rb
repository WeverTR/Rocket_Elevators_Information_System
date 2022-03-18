class Leads < ApplicationRecord
    has_many :quote
    attr_accessor :remove_attachment
    has_one_attached :attachment
end
