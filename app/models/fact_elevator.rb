class FactElevator < PostgresRecord
    belongs_to :elevator
    has_one :building
    has_one :dim_customer
end