class AddInstallFeesToQuotes < ActiveRecord::Migration[5.2]
  def change
    add_column :quotes, :InstallFees, :integer
  end
end
