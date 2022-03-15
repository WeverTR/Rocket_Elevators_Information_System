class CreateFactElevators < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_elevators do |t|

      t.timestamps
    end
  end
end
