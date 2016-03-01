class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.string :yesterday
      t.string :today
      t.string :problems
      t.integer :user_id
      t.integer :project_id

      t.timestamps
    end
  end
end
