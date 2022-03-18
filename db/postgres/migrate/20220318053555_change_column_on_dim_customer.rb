class ChangeColumnOnDimCustomer < ActiveRecord::Migration[5.2]
  def change
    change_column_null :dim_customers, :created_at, true
    change_column_null :dim_customers, :updated_at, true
  end
end
