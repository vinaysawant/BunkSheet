require 'spec_helper'

describe Schedule do

	before(:each) do
	  @fbuser = Factory(:fbuser)
		@attr = {:day => "monday",:lecture => "DAA"}
	end

	it "should create new instance with valid attributes" do
		@fbuser.schedules.create!(@attr)
	end
	
	it "should require a day" do
		no_name_user = Schedule.new(@attr.merge(:day => ""))
		no_name_user.should_not be_valid
	end

	it "should require a lecture" do
		no_name_user = Schedule.new(@attr.merge(:lecture => ""))
		no_name_user.should_not be_valid
	end
	
	describe "user associations" do
		before(:each) do
		  @schedule = @fbuser.schedules.create(@attr)
		end

		it "should have a user attribute" do
			@schedule.should respond_to(:fbuser)
		end		
		
		it "should have the right associated user" do
			@schedule.fbuser_id.should == @fbuser.id
			@schedule.fbuser.should == @fbuser
		end		
	end

	describe "validations" do
		it "should have a user id" do
			Schedule.new(@attr).should_not be_valid
		end
	end

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

