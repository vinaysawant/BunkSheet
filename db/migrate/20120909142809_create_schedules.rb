class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :day
      t.string :lecture
      t.integer :user_id

      t.timestamps
    end
  end
end
