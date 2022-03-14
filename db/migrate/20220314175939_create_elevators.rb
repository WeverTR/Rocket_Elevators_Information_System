class CreateElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :elevators do |t|
      t.integer :ColumnId
      t.integer :Serial_number
      t.string :Model
      t.string :Type
      t.string :Status
      t.date :Date_of_commissioning
      t.date :Date_of_last_inspection
      t.string :Certificate_of_inspection
      t.string :Information
      t.string :Notes

      t.timestamps
    end
  end
end
