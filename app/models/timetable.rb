class Timetable < ActiveRecord::Base
  attr_accessible :day, :endtime, :lecture, :timestarted, :user_id
	belongs_to :user
#	has_many :lectures
	validates :day,					:presence => true
	validates :timestarted,	:presence => true
	validates :endtime,			:presence => true	
	validates :lecture, 		:presence => true, :length => {:maximum => 20}
	validates :user_id, 		:presence => true
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

