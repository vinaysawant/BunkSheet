class ApplicationController < ActionController::Base
  protect_from_forgery
	include SessionsHelper

	private

	def fbcurrent_user
	  @fbcurrent_user ||= Fbuser.find(session[:fbuser_id]) if session[:fbuser_id]
	end

	helper_method :fbcurrent_user
end
