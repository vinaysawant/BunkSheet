require 'spec_helper'

describe TimetableController do
	render_views

	describe "GET 'init'" do
	  it "returns http success" do
      	get :init
      	response.should be_success
    end
	  it "should have the right title" do
			get :init
			response.should have_selector('title',:content => "Init Time Table")
		end
  end
end
