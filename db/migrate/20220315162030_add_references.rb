class AddReferences < ActiveRecord::Migration[5.2]
  def change
<<<<<<< HEAD
    add_reference :addresses, :building, foreign_key:true
=======
    add_reference :customers, :user, foreign_key: true
>>>>>>> e226595ab075df5649c692b81b212238579b8f75
    add_reference :buildings, :customer, foreign_key: true
    add_reference :buildings, :address, foreign_key: true
    add_reference :building_details, :building, foreign_key: true
    add_reference :batteries, :building, foreign_key: true
    add_reference :batteries, :employee, foreign_key: false
    add_reference :columns, :battery, foreign_key: true
    add_reference :elevators, :column, foreign_key: true
<<<<<<< HEAD
    add_reference :customers, :user, foreign_key: true
    add_reference :customers, :address, foreign_key: true
=======
    add_reference :elevators, :building, foreign_key: true
>>>>>>> e226595ab075df5649c692b81b212238579b8f75
  end
end
