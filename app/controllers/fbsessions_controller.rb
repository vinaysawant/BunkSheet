class FbsessionsController < ApplicationController
  def create
    fbuser = Fbuser.from_omniauth(env["omniauth.auth"])
    session[:fbuser_id] = fbuser.id
    redirect_to root_path, notice: 'Welcome to bunksheet \Follow these steps \1.First Create Your weekly schedule
2.goto "settings => weekly schedule"'
  end

  def destroy
    session[:fbuser_id] = nil
    redirect_to root_path
  end
end


