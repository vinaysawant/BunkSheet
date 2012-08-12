class CreateTimetables < ActiveRecord::Migration
  def change
    create_table :timetables do |t|
      t.string :day
      t.time :timestarted
      t.time :endtime
      t.integer :lecture_id
      t.integer :user_id

      t.timestamps
    end
  end
end
