class AddLastNameToEmployees < ActiveRecord::Migration[5.2]
  def change
    add_column :employees, :last_name, :string
  end
end
