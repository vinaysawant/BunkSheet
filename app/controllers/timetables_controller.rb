class TimetablesController < ApplicationController
	
	before_filter :authenticate

  def new
		@title = "Init Time Table"
		@timetable = Timetable.new
  end

	def create
		@timetable = current_user.timetables.build(params[:timetable])
	  if @timetable.save
#			redirect_to root_path, :flash => {:success => "Lecture added!"}
			redirect_to inittime_path, :flash => {:success => "Lecture added!"}
		else
			render 'new',	:flash => {:success => "Something went wrong please try again!"}
		end
	end

end
