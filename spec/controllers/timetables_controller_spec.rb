require 'spec_helper'

describe TimetablesController do
	render_views

	describe "GET 'new'" do


		before(:each) do
		  @user = test_sign_in(Factory(:user))
		end

	  it "returns http success" do
      	get :new
      	response.should be_success
    end
	  it "should have the right title" do
			get :new
			response.should have_selector('title',:content => "Init Time Table")
		end
  end
	
	describe "access control" do
		it "should deny access to create" do
			post:create
			response.should redirect_to(signin_path)
		end
	end

	describe "POST 'create'" do

		before(:each) do
		  @user = test_sign_in(Factory(:user))
		end

		describe "failure" do
			before(:each) do
			  @attr = {:day => "",:timestarted => "",:endtime => "",:lecture => ""}
			end			

#			it "should have the right title" do
#				post :create, :timetable => @attr
#				response.should have_selector('title',:content => "Init Time Table")
#			end

			it "should render init page" do
				post :create, :timetable => @attr
				response.should render_template('pages/home')				
			end

			it "should not create a timetable" do
				lambda do
					post :create, :timetable => @attr						
				end.should_not change(Timetable,:count)
			end
		end
	
		describe "success" do
			before(:each) do
			  @attr = {:day => "monday",:timestarted => 10,
								 :endtime => "11",:lecture => "DAA",
								}
			end

			it "should create a timetable" do
				lambda do
					post :create,:timetable => @attr
				end.should change(Timetable,:count).by(1)
			end

			it "should redirect_to root path" do
				post :create ,:timetable => @attr
				response.should redirect_to(root_path)
			end

#			it "should create message" do
#				post :create,:timetable => @attr
#				flash[:success].should =~ /You have added 1 lecture/i
#			end
		end
	end
end
