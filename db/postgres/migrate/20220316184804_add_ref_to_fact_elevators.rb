class AddRefToFactElevators < ActiveRecord::Migration[5.2]
  def change
    add_reference :fact_elevators, :elevator, foreign_key: true
    add_reference :fact_elevators, :building, foreign_key: true
    add_reference :fact_elevators, :customer, foreign_key: true
    add_reference :fact_elevators, :address, foreign_key: true
  end
end
