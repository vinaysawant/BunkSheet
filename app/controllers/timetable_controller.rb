class TimetableController < ApplicationController
  def init
		@title = "Init Time Table"
		@timetable = Timetable.new
  end
end
