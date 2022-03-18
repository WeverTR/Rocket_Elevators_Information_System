class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :fullname
      t.string :companyname
      t.string :email
      t.string :phone
      t.string :projectname
      t.string :projectdescription
      t.string :departmentincharge
      t.string :message

      t.timestamps
    end
  end
end
