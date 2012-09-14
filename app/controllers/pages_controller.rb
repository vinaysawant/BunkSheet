class PagesController < ApplicationController

  def home
		@title="Home"
		if fbcurrent_user
			@current_schedule = fbcurrent_user.schedules
		end
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
