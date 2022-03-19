class ChangeColumnOnFactQuote < ActiveRecord::Migration[5.2]
  def change
    change_column_null :fact_quotes, :created_at, true
    change_column_null :fact_quotes, :updated_at, true
  end
end
