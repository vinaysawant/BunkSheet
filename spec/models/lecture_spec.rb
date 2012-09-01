require 'spec_helper'

describe Lecture do

#	before(:each) do
#		@user = Factory(:user)
#		@attr = {:lecture => "DAA"}	  
#	end

#	it "should cr11eate a new instance with valid attributes" do
#		@user.lectures.create!(@attr)
#	end

#	describe "user associations" do
#		
#		before(:each) do
#		  @lecture = @user.lectures.create(@attr)
#		end
#		
#		it "should have a user attribute" do
#			@lecture.should respond_to(:user)
#		end
#		
#		it "should have the right associated user" do
#			@lecture.user_id.should == @user.id
#			@lecture.user.should == @user
#		end
#	end

#	describe "validations" do
#		it "should have a user id" do
#			Lecture.new(@attr).should_not be_valid
#		end

#		it "should require a non blank content(lecture)" do
#			@user.lectures.build(:lecture => "    ").should_not be_valid
#		end

#		it "should reject long subject" do
#			@user.lectures.build(:lecture => "a" * 21).should_not be_valid
#		end
#	end
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

