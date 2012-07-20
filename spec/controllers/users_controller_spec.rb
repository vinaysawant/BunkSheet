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

		it "should have the right title" do
			get :show,:id => @user
			response.should have_selector('title',:content => @user.name)
		end

		it "should have the user's name" do
			get :show,:id => @user
			response.should have_selector('h1',:content => @user.name)
		end

		it "should have a profile image" do
			get :show ,:id => @user
			response.should have_selector('h1>img',:class => "gravatar")
		end

		it "should have the right url" do
			get :show,:id => @user
			response.should have_selector('td>a',:content => user_path(@user),
																					 :href    => user_path(@user))
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

	describe "POST 'create'" do
		
		describe "failure" do
			
			before(:each) do
			  @attr = {:name =>"",:email => "",:password => "",
								 :password_confirmation => ""}
			end

			it "should have the right title" do
				post :create, :user => @attr
				response.should have_selector('title',:content => "Sign up")
			end

			it "should render the new page" do
				post :create, :user => @attr
				response.should render_template('new')
			end

			it "should not create a user" do
				lambda do
					post :create,:user => @attr
				end.should_not change(User,:count)
			end
		end

		describe "success" do
	
			before(:each) do
			  @attr = {:name => "New User",:email => "example@gmail.com",
								 :password => "footer",:password_confirmation => "footer"}
			end	

			it "should create a user" do
				lambda do
					post :create,:user => @attr
				end.should change(User,:count).by(1)
			end		

			it "should redirect to user show page" do
				post :create ,:user => @attr
				response.should redirect_to(user_path(assigns(:user)))
			end

			it "should create a welcome message" do
				post :create, :user => @attr
				flash[:success].should =~ /welcome to the bunksheet/i
			end

			it "should sign the user in" do
				post :create, :user => @attr
				controller.should be_signed_in
			end
		end
	end
end
