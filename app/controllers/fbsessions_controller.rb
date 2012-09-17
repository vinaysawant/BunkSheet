class FbsessionsController < ApplicationController
  def create
    fbuser = Fbuser.from_omniauth(env["omniauth.auth"])
    session[:fbuser_id] = fbuser.id
    redirect_to root_path, notice: 'Welcome to bunksheet \n***Follow these steps \n 1.First Create Your weekly schedule
\n 2.goto "settings => weekly schedule"'
  end

  def destroy
    session[:fbuser_id] = nil
    redirect_to root_path
  end
end


