require 'spec_helper'

describe Timetable do
	before(:each) do
	  @user = Factory(:user)
		@attr = {:day => "monday",
						:timestarted => 10,
						:endtime => 11,
						:lecture => "DAA"
						}
	end

	it "should create new instance with valid attributes" do
		@user.timetables.create!(@attr)
	end
	
	it "should require a day" do
		no_name_user = Timetable.new(@attr.merge(:day => ""))
		no_name_user.should_not be_valid
	end

	it "should require a lecture" do
		no_name_user = Timetable.new(@attr.merge(:lecture => ""))
		no_name_user.should_not be_valid
	end
	
	describe "user associations" do
		before(:each) do
		  @timetable = @user.timetables.create(@attr)
		end

		it "should have a user attribute" do
			@timetable.should respond_to(:user)
		end		
		
		it "should have the right associated user" do
			@timetable.user_id.should == @user.id
			@timetable.user.should == @user
		end		
	end

	describe "validations" do
		it "should have a user id" do
			Timetable.new(@attr).should_not be_valid
		end
	end
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

