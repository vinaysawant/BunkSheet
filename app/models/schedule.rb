class Schedule < ActiveRecord::Base
  attr_accessible :day, :lecture, :user_id
	belongs_to :user
	
	validates :day,		 :presence => true
	validates :lecture,:presence => true
	validates :user_id,:presence => true
end

# == Schema Information
#
# Table name: schedules
#
#  id         :integer(4)      not null, primary key
#  day        :string(255)
#  lecture    :string(255)
#  user_id    :integer(4)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

