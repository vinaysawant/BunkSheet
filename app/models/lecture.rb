class Lecture < ActiveRecord::Base
  attr_accessible :lecture
	belongs_to :user
	belongs_to :timetable

	validates :lecture, :presence => true, :length => {:maximum => 20}
	validates :user_id, :presence => true
end

# == Schema Information
#
# Table name: lectures
#
#  id         :integer(4)      not null, primary key
#  lecture    :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  user_id    :integer(4)
#

