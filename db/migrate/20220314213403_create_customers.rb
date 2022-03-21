class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.datetime :customer_creation_date
      t.string :company_name
      t.string :full_name_company_contact
      t.string :company_contact_phone
      t.string :email_company
      t.string :company_description
      t.string :full_name_service_technical_authority
      t.string :technical_authority_phone
      t.string :technical_authority_email

      t.timestamps
    end
  end
end
