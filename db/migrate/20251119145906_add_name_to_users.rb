class AddNameToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :name, :string, default: "default_username"

    add_index :users, [:name, :email], unique: true
  end
end
