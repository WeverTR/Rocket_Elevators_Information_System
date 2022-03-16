class CreateFactElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_elevators do |t|
      t.integer :serial_number
      t.string :date_of_commissioning
      t.integer :building_id
      t.integer :customer_id
      t.string :building_city


      t.timestamps
    end
  end
end
