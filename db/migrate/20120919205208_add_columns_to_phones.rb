class AddColumnsToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :last_name, :string
    add_column :phones, :first_name, :string
    add_column :phones, :number, :string
    add_column :phones, :address, :string
    add_column :phones, :comments, :text
  end
end
