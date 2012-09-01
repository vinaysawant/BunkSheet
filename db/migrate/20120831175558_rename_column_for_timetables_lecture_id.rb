class RenameColumnForTimetablesLectureId < ActiveRecord::Migration
  def up
		rename_column :timetables ,:lecture_id ,:lecture
  end

  def down
  end
end
