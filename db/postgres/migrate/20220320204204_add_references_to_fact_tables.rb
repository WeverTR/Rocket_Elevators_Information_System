class AddReferencesToFactTables < ActiveRecord::Migration[5.2]
  def change
    add_reference :dim_customers, :fact_quotes, foreign_key: true
    add_reference :dim_customers, :fact_contacts, foreign_key: true
    add_reference :dim_customers, :fact_elevators, foreign_key: true
  end
end
