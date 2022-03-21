class ChangeColumnOnFactElevator < ActiveRecord::Migration[5.2]
  def change
    change_column_null :fact_elevators, :created_at, true
    change_column_null :fact_elevators, :updated_at, true
  end
end
