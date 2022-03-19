class CreateFactQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_quotes do |t|
      t.integer :quote_id
      t.string :creation
      t.string :company_name
      t.string :email
      t.string :nb_elevator
      
      t.timestamps
    end
  end
end
