class AddReferences < ActiveRecord::Migration[5.2]
  def change
    add_reference :customers, :user, foreign_key: true
    add_reference :buildings, :customer, foreign_key: true
    add_reference :buildings, :address, foreign_key: true
    add_reference :building_details, :building, foreign_key: true
    add_reference :batteries, :building, foreign_key: true
    add_reference :batteries, :employee, foreign_key: false
    add_reference :columns, :battery, foreign_key: true
    add_reference :elevators, :column, foreign_key: true
    add_reference :elevators, :building, foreign_key: true
  end
end
