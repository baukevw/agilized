class AddOAuthToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :oauth, :boolean
  end
end
