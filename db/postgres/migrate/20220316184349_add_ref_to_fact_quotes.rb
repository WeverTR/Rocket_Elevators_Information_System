class AddRefToFactQuotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :fact_quotes, :quote, foreign_key: true
    add_reference :fact_quotes, :building, foreign_key: true
    add_reference :fact_quotes, :address, foreign_key: true
    add_reference :fact_quotes, :customer, foreign_key: true
  end
end
