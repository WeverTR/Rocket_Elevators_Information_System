class AddFirstNameToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :first_name, :string
  end
end
