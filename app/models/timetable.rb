class Timetable < ActiveRecord::Base
  attr_accessible :day, :endtime, :lecture_id, :timestarted, :user_id
end
