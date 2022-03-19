class FactQuote < PostgresRecord
    belongs_to :quote
    has_one :address
    has_many :elevator
    has_one :dim_customer
end