class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :FullName
      t.string :CompanyName
      t.string :Email
      t.string :Phone
      t.string :ProjectName
      t.string :ProjectDescription
      t.string :DepartmentInCharge
      t.string :Message

      t.timestamps
    end
  end
end
