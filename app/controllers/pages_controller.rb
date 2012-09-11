class PagesController < ApplicationController

  def home
		@title="Home"
		@current_schedule = current_user.schedules
  end

  def contact
		@title="Contact"
  end

  def about
		@title="About"
  end

  def help
		@title="Help"
  end
end
