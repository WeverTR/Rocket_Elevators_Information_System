class CreateQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :quotes do |t|
      t.string :buildingtype
      t.integer :numofapt
      t.integer :numoffloors
      t.integer :numofbase
      t.integer :numofpark
      t.integer :numofcomp
      t.integer :numofelev
      t.integer :maxocc
      t.integer :bushrs
      t.integer :corp
      t.string :liftCage
      t.integer :elevatorNum
      t.integer :unitPrice
      t.integer :totalPriceElevators
      t.integer :installFees
      t.integer :totalPrice

      t.timestamps
    end
  end
end
