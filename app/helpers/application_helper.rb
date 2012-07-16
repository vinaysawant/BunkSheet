module ApplicationHelper
#returns the title on per-page basis

	def title

		base_title = "BunkSheet for Bunkers"

		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end

	end

end
