class CreateUserInTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :user_in_teams do |t|
      t.integer :role_id
      t.integer :user_id
      t.integer :team_id
      t.boolean :admin

      t.timestamps
    end
  end
end
