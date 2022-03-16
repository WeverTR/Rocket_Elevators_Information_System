class AddRefToDimCustomers < ActiveRecord::Migration[5.2]
  def change
    add_reference :dim_customers, :elevator, foreign_key: true
    add_reference :dim_customers, :building, foreign_key: true
    add_reference :dim_customers, :customer, foreign_key: true
    add_reference :dim_customers, :address, foreign_key: true
  end
end
