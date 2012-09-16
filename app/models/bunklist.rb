class Bunklist < ActiveRecord::Base
  attr_accessible :date, :fbuser_id, :schedule_id
	belongs_to :fbuser
	belongs_to :schedule
#	validates :fbuser_id,:presence => true
#	validates :fbuser_id,:presence => true
end

# == Schema Information
#
# Table name: bunklists
#
#  id          :integer(4)      not null, primary key
#  date        :string(255)
#  schedule_id :integer(4)
#  fbuser_id   :integer(4)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#

