class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.integer :BuildingId
      t.string :Type
      t.string :Status
      t.integer :EmployeeId
      t.date :Date_of_commissioning
      t.date :Date_of_last_inspection
      t.string :Certificate_of_operations
      t.string :Information
      t.string :Notes

      t.timestamps
    end
  end
end
