class AddSprintIdToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :sprint_id, :integer
  end
end
