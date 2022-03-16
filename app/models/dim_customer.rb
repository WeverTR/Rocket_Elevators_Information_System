class DimCustomer < PostgresRecord
    belongs_to :customer
    has_one :building
    has_many :elevator
end