class ChangeDataTypeForTimetablesLectureId < ActiveRecord::Migration
  def up
		change_column :timetables , :lecture_id ,:string
  end

  def down
		change_column :timetables , :lecture_id ,:integer
  end
end
