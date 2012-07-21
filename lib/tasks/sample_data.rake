require 'faker'

namespace :db do

	desc "Fill database with sample data"
	task :populate => :environment do
		Rake::Task['db:reset'].invoke
		User.create!(:name => "Example user",
								 :email => "example@gmail.com",
								 :password => "footer",
								 :password_confirmation => "footer")

		150.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@gmail.com"
			password = "password"
			User.create!(:name => name,
									 :email => email,
									 :password => password,
									 :password_confirmation => password)
		end
	end
end
