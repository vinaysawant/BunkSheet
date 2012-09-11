class DropTablesLectureTimetable < ActiveRecord::Migration
  def up
		drop_table :lectures
		drop_table :timetables
  end

  def down
  end
end
