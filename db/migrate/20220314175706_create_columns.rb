class CreateColumns < ActiveRecord::Migration[5.2]
  def change
    create_table :columns do |t|
      t.integer :BatteryId
      t.string :Type
      t.integer :Number_of_floor_served
      t.string :Status
      t.string :Information
      t.string :Notes

      t.timestamps
    end
  end
end
