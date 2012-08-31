class TimetableController < ApplicationController
  def init
		@title = "Init Time Table"
		@lecture = Lecture.new
  end
end
