class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.integer :Number_Of_Apartments
      t.integer :Number_Of_Floors
      t.integer :Number_Of_Basements
      t.integer :Number_Of_Companies
      t.integer :Number_Of_Parking_Spots
      t.integer :Number_Of_Elevator_Cages
      t.integer :Maximum_Occupants_Per_Floor
      t.integer :Number_Of_Hours_Of_Activity_In_The_Building

      t.timestamps
    end
  end
end
