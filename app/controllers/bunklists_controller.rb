class BunklistsController < ApplicationController

	before_filter :fbauthenticate
	
	def index
		@bunklists = @fbcurrent_user.bunklists
	end

	def show
		@bunklist = Bunklist.find(params[:id])
	end
	
	def create
		schedule = Schedule.find(params[:schedule_id])
		@bunklist = @fbcurrent_user.bunklists.build
		@bunklist.schedule = schedule

		if @bunklist.save
			redirect_to root_path, notice: 'Schedule was successfully added to list.'
		else
			redirect_to root_path, notice: 'Schedule was not added to list.'
		end
	
	end

end
