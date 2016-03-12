class CreateTeamInProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :team_in_projects do |t|
      t.integer :team_id
      t.integer :project_id

      t.timestamps
    end
  end
end
