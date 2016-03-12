class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      t.text :yesterday
      t.text :today
      t.text :problems
      t.boolean :late
      t.text :late_reason
      t.boolean :absence
      t.text :absence_reason
      t.integer :daily_standup_id
      t.integer :user_id

      t.timestamps
    end
  end
end
