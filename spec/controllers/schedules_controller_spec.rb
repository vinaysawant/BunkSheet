require 'spec_helper'

describe SchedulesController do
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
			  @attr = {:day => "",:lecture => ""}
			end

			it "should not create a timetable" do
				lambda do
					post :create, :schedule => @attr						
				end.should_not change(Schedule,:count)
			end
		end
	
		describe "success" do
			before(:each) do
			  @attr = {:day => "monday",:lecture => "DAA"
								}
			end

			it "should create a timetable" do
				lambda do
					post :create,:schedule => @attr
				end.should change(Schedule,:count).by(1)
			end
		end
	end
#  # This should return the minimal set of attributes required to create a valid
#  # Schedule. As you add validations to Schedule, be sure to
#  # update the return value of this method accordingly.
#  def valid_attributes
#    {}
#  end

#  # This should return the minimal set of values that should be in the session
#  # in order to pass any filters (e.g. authentication) defined in
#  # SchedulesController. Be sure to keep this updated too.
#  def valid_session
#    {}
#  end

#  describe "GET index" do
#    it "assigns all schedules as @schedules" do
#      schedule = Schedule.create! valid_attributes
#      get :index, {}, valid_session
#      assigns(:schedules).should eq([schedule])
#    end
#  end

#  describe "GET show" do
#    it "assigns the requested schedule as @schedule" do
#      schedule = Schedule.create! valid_attributes
#      get :show, {:id => schedule.to_param}, valid_session
#      assigns(:schedule).should eq(schedule)
#    end
#  end

#  describe "GET new" do
#    it "assigns a new schedule as @schedule" do
#      get :new, {}, valid_session
#      assigns(:schedule).should be_a_new(Schedule)
#    end
#  end

#  describe "GET edit" do
#    it "assigns the requested schedule as @schedule" do
#      schedule = Schedule.create! valid_attributes
#      get :edit, {:id => schedule.to_param}, valid_session
#      assigns(:schedule).should eq(schedule)
#    end
#  end

#  describe "POST create" do
#    describe "with valid params" do
#      it "creates a new Schedule" do
#        expect {
#          post :create, {:schedule => valid_attributes}, valid_session
#        }.to change(Schedule, :count).by(1)
#      end

#      it "assigns a newly created schedule as @schedule" do
#        post :create, {:schedule => valid_attributes}, valid_session
#        assigns(:schedule).should be_a(Schedule)
#        assigns(:schedule).should be_persisted
#      end

#      it "redirects to the created schedule" do
#        post :create, {:schedule => valid_attributes}, valid_session
#        response.should redirect_to(Schedule.last)
#      end
#    end

#    describe "with invalid params" do
#      it "assigns a newly created but unsaved schedule as @schedule" do
#        # Trigger the behavior that occurs when invalid params are submitted
#        Schedule.any_instance.stub(:save).and_return(false)
#        post :create, {:schedule => {}}, valid_session
#        assigns(:schedule).should be_a_new(Schedule)
#      end

#      it "re-renders the 'new' template" do
#        # Trigger the behavior that occurs when invalid params are submitted
#        Schedule.any_instance.stub(:save).and_return(false)
#        post :create, {:schedule => {}}, valid_session
#        response.should render_template("new")
#      end
#    end
#  end

#  describe "PUT update" do
#    describe "with valid params" do
#      it "updates the requested schedule" do
#        schedule = Schedule.create! valid_attributes
#        # Assuming there are no other schedules in the database, this
#        # specifies that the Schedule created on the previous line
#        # receives the :update_attributes message with whatever params are
#        # submitted in the request.
#        Schedule.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
#        put :update, {:id => schedule.to_param, :schedule => {'these' => 'params'}}, valid_session
#      end

#      it "assigns the requested schedule as @schedule" do
#        schedule = Schedule.create! valid_attributes
#        put :update, {:id => schedule.to_param, :schedule => valid_attributes}, valid_session
#        assigns(:schedule).should eq(schedule)
#      end

#      it "redirects to the schedule" do
#        schedule = Schedule.create! valid_attributes
#        put :update, {:id => schedule.to_param, :schedule => valid_attributes}, valid_session
#        response.should redirect_to(schedule)
#      end
#    end

#    describe "with invalid params" do
#      it "assigns the schedule as @schedule" do
#        schedule = Schedule.create! valid_attributes
#        # Trigger the behavior that occurs when invalid params are submitted
#        Schedule.any_instance.stub(:save).and_return(false)
#        put :update, {:id => schedule.to_param, :schedule => {}}, valid_session
#        assigns(:schedule).should eq(schedule)
#      end

#      it "re-renders the 'edit' template" do
#        schedule = Schedule.create! valid_attributes
#        # Trigger the behavior that occurs when invalid params are submitted
#        Schedule.any_instance.stub(:save).and_return(false)
#        put :update, {:id => schedule.to_param, :schedule => {}}, valid_session
#        response.should render_template("edit")
#      end
#    end
#  end

#  describe "DELETE destroy" do
#    it "destroys the requested schedule" do
#      schedule = Schedule.create! valid_attributes
#      expect {
#        delete :destroy, {:id => schedule.to_param}, valid_session
#      }.to change(Schedule, :count).by(-1)
#    end

#    it "redirects to the schedules list" do
#      schedule = Schedule.create! valid_attributes
#      delete :destroy, {:id => schedule.to_param}, valid_session
#      response.should redirect_to(schedules_url)
#    end
#  end

end
