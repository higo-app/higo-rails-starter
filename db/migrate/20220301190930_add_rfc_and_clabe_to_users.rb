class AddRfcAndClabeToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :rfc, :string
    add_column :users, :clabe, :string
  end
end
