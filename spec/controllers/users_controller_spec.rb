require 'spec_helper'

describe UsersController do
	render_views

	describe "GET 'show'" do

		before(:each) do
		  @user = Factory(:user)
		end	
		
		it "should be successful" do
			get :show,:id => @user
			response.should be_success
		end

		it "should find the right user" do
			get :show,:id => @user
			assigns(:user) == @user
		end
	end

  describe "GET 'new'" do
    it "returns http success" do
      get :new
      response.should be_success
    end

		it "should have a right title" do
			get :new
			response.should have_selector("title", :content => "Sign up")
		end 
	end 
end
