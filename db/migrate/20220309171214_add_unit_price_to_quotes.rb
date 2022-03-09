class AddUnitPriceToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :Range, :integer
  end
end
