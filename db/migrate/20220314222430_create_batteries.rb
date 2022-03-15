class CreateBatteries < ActiveRecord::Migration[5.2]
  def change
    create_table :batteries do |t|
      t.integer :building_id # link to an elevator battery to a building where it's deployed
      t.string :type
      t.string :status   
      t.integer :employee_id # link a battery to a employee
      t.datetime :date_of_commissioning
      t.datetime :date_of_last_inspection
      t.string :certificate_of_operations
      t.string :information
      t.string :notes

      t.timestamps
    end
  end
end
