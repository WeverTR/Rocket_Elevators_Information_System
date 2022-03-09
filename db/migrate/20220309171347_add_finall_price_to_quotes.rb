class AddFinallPriceToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :FinalPrice, :integer
  end
end
