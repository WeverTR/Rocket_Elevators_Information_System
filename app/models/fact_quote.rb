class FactQuote < PostgresRecord
    belongs_to :quote
    has_one :dim_customer
end