class ChangeColumnOnFactContact < ActiveRecord::Migration[5.2]
  def change
    change_column_null :fact_contacts, :created_at, true
    change_column_null :fact_contacts, :updated_at, true
  end
end
