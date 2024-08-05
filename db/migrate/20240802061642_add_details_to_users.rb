class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :company_name, :string
    add_column :users, :booth_name, :string
    add_column :users, :booth_details, :text
    add_column :users, :full_name, :string
    add_column :users, :phone, :string
    add_column :users, :postal_code, :string
    add_column :users, :address, :text
  end
end
