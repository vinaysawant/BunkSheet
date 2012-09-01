Factory.define :user do |user|
	user.name									 "Vinay Sawant"
	user.email								 "sawant@gmail.com"
	user.password							 "foobar"
	user.password_confirmation "foobar"
end

Factory.sequence :email do |n|
	"person-#{n}@example.com"
end

Factory.define :timetable do |timetable|
	timetable.day						"monday"
	timetable.timestarted 	10
	timetable.endtime 			11
	timetable.lecture				"DAA"
	timetable.association 	:user
end
