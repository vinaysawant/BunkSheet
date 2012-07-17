class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
	attr_accessor		:password
	email_regx = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, :presence   => true,
									 :length	   => { :maximum => 50}
	validates :email,:presence   => true,
									 :format 	   => { :with => email_regx},
									 :uniqueness => { :case_sensitive => false}
	validates :password, :presence => true,
											 :confirmation => true,
											 :length => { :within => 6..40}
end

# == Schema Information
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#


