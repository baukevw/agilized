class CreateDailyStandups < ActiveRecord::Migration[5.0]
  def change
    create_table :daily_standups do |t|
      t.datetime :date
      t.text :description
      t.integer :sprint_id

      t.timestamps
    end
  end
end
