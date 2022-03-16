class AddRefToFactContacts < ActiveRecord::Migration[5.2]
  def change
    add_reference :fact_contacts, :customer, foreign_key: true
    add_reference :fact_contacts, :leads, foreign_key: true
  end
end
