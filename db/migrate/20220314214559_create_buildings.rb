class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.integer :customer_id # bind a customer to the building
      t.string :address # in the address table
      t.string :full_name_building_admin
      t.string :email_building_admin
      t.string :phone_building_admin
      t.string :full_name_technical_contact
      t.string :email_technical_contact
      t.string :phone_technical_contact

      t.timestamps
    end
  end
end
