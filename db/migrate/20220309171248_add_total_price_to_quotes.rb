class AddTotalPriceToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :TotalPrice, :integer
  end
end
