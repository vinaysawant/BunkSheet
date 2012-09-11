Factory.define :user do |user|
	user.name									 "Vinay Sawant"
	user.email								 "sawant@gmail.com"
	user.password							 "foobar"
	user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
	"person-#{n}@example.com"
end

Factory.define :schedule do |schedule|
	schedule.day						"monday"
	schedule.lecture				"DAA"
	schedule.association 	:user
end
