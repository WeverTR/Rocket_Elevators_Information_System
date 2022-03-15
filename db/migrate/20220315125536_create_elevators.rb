class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.integer :column_id # link elevator to column where it's deployed and 
      t.integer :serial_number
      t.string :model
      t.string :type
      t.string :status
      t.datetime :date_of_commissioning
      t.datetime :date_of_last_inspection
      t.string :information
      t.string :notes 

      t.timestamps
    end
  end
end
