class DimCustomer < PostgresRecord
    belongs_to :customer
    belongs_to :fact_quotes
    belongs_to :fact_elevators
    belongs_to :fact_contacts
end