class AddEmailToQuote < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :email, :string
    add_column :quotes, :companyname, :string
  end
end
