class FbusersController < ApplicationController
	def index
#		@fbusers = Fbuser.all
		@fbusers = Fbuser.paginate(:page => params[:page])
		@title = "All users"
	end

	def show
		@fbuser = Fbuser.find(params[:id])
		@title = @fbuser.name
	end
end
