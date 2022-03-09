class AddTypeOfBuildingToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :TypeOfBuilding, :string
  end
end
