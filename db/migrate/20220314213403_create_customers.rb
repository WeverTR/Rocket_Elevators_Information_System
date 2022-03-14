class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.integer :user_id #  bind the client to the connecting user
      t.datetime :customer_creation_date
      t.string :company_hq_address # get from address table
      t.string :full_name_company_contact
      t.integer :company_contact_phone
      t.string :email_company
      t.string :company_description
      t.string :full_name_service_technical_authority
      t.integer :technical_autority_phone
      t.string :technical_autority_email

      t.timestamps
    end
  end
end
