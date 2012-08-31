require 'spec_helper'

describe "FriendlyForwardings" do
	
	it "should forwad to requested page after sign in" do
		user = Factory(:user)
		visit edit_user_path(:id => user.id)
		fill_in 		:email, 	:with => user.email
		fill_in			:password,:with => user.password
		click_button 
		response.should render_template('users/edit')
		visit signout_path
		visit signin_path
		fill_in 		:email, 	:with => user.email
		fill_in			:password,:with => user.password
		click_button 
		response.should render_template('users/show')

	end
end
