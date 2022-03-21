class FactElevator < PostgresRecord
    belongs_to :elevator
    has_one :dim_customer
end