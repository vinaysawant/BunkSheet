class Timetable < ActiveRecord::Base
  attr_accessible :day, :endtime, :lecture, :timestarted, :user_id
#	has_many :lectures
end

# == Schema Information
#
# Table name: timetables
#
#  id          :integer(4)      not null, primary key
#  day         :string(255)
#  timestarted :time
#  endtime     :time
#  lecture     :string(255)
#  user_id     :integer(4)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

