class DropTableTimetable < ActiveRecord::Migration
  def up
		drop_table :timetables
  end

  def down
  end
end
