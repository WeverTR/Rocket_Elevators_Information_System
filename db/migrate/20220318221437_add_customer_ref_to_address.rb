class AddCustomerRefToAddress < ActiveRecord::Migration[5.2]
  def change
    add_reference :customers, :address, foreign_key: true
  end
end
