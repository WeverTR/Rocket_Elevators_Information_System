class FactContact < PostgresRecord
    belongs_to :lead
    has_one :dim_customer
end