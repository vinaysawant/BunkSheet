class Schedule < ActiveRecord::Base
  attr_accessible :day, :lecture, :fbuser_id
	belongs_to :user
	belongs_to :fbuser	
	validates :day,		 :presence => true
	validates :lecture,:presence => true
	validates :fbuser_id,:presence => true
end

# == Schema Information
#
# Table name: schedules
#
#  id         :integer(4)      not null, primary key
#  day        :string(255)
#  lecture    :string(255)
#  fbuser_id  :integer(4)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

