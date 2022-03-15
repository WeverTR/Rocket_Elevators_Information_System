class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.integer :battery_id # link a column of elevators to the battery
      t.string :type
      t.integer :Number_of_floor_served
      t.string :status
      t.string :information
      t.string :notes

      t.timestamps
    end
  end
end
