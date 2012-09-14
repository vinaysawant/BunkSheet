Factory.define :user do |user|
	user.name									 "Vinay Sawant"
	user.email								 "sawant@gmail.com"
	user.password							 "foobar"
	user.password_confirmation "foobar"
end

Factory.define :fbuser do |fbuser|
  	  fbuser.provider  "facebook"
  	  fbuser.uid  "100000213979087"
  	  fbuser.name  "fb user"
  	  fbuser.oauth_token  "AAAF5ichVAfIBADUqgSixxZAHRCkZB8yM3ZBQnv37qMGvgC2h8bFg5x5CVsznZCuGk1peIxIuosuZBpbYOtn1DVNCdsrRxN5qXImAIcUwIxwZDZD"
  	  fbuser.oauth_expires_at  "2012-11-13 13:41:54"
end

Factory.sequence :email do |n|
	"person-#{n}@example.com"
end

Factory.define :schedule do |schedule|
	schedule.day						"monday"
	schedule.lecture				"DAA"
	schedule.association 	:fbuser
end
