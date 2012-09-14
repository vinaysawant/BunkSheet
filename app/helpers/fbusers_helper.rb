module FbusersHelper
	def gravatar_for(fbuser, options = {:size => 50})
		gravatar_image_tag(fbuser.email.downcase,:alt => fbuser.name,
																					 :class => 'gravatar',
																					 :gravatar => options)
	end
end
