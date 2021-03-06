class Userprofile < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :username, :string
    add_column :users, :photo, :string
    add_column :users, :uid, :string
    add_index :users, :uid
    add_column :users, :provider, :string
    add_index :users, :provider
  end
end
