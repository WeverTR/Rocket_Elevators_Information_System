class CreateFactContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_contacts do |t|
      t.integer :contact_id
      t.string :creation_date
      t.string :Company_name
      t.string :email
      t.string :project_name

      t.timestamps
    end
  end
end
