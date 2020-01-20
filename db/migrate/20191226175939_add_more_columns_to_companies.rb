class AddMoreColumnsToCompanies < ActiveRecord::Migration[6.0]
  def change
    add_column :companies, :tenant, :string
    add_column :companies, :name, :string
    add_column :companies, :url, :string
    add_column :companies, :email, :string
    add_column :companies, :phone_number, :string
    add_column :companies, :logo, :text
  end
end
