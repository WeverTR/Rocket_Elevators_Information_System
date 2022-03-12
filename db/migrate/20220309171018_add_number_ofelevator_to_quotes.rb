class AddNumberOfelevatorToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :NumberOfElevator, :integer
  end
end
