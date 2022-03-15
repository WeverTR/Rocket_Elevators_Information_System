class DropLeads < ActiveRecord::Migration[5.2]
  def change
    drop_table :leads
  end
end
