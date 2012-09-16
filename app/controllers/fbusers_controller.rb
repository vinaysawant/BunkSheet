class FbusersController < ApplicationController
	before_filter :fbauthenticate

	def index
#		@fbusers = Fbuser.all
		@fbusers = Fbuser.paginate(:page => params[:page])
		@title = "All users"
	end

	def show
		@fbuser = Fbuser.find(params[:id])
		@title = @fbuser.name
	end

	private

		def fbauthenticate
			if !fbcurrent_user
				flash[:notice] = "Please sign in to access this page"
				deny_access unless fbcurrent_user
			end
		end
end
