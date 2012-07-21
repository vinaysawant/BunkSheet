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

	before_save :encrypt_password

	def has_password?(submitted_password)
		encrypted_password == encrypt(submitted_password)
	end

  class << self
		def authenticate(email, submitted_password)
			user = find_by_email(email)
			(user && user.has_password?(submitted_password)) ? user : nil
		end

		def authenticate_with_salt(id, cookie_salt)
			user = find_by_id(id)
			(user && user.salt == cookie_salt) ? user : nil
		end
	end

	private

		def encrypt_password
			self.encrypted_password = encrypt(password)
			self.salt = make_salt if new_record?
		end
	
		def encrypt(string)
			secure_hash("{salt}--#{string}")
		end

		def make_salt
			secure_hash("#{Time.now.utc}--#{password}")
		end

		def secure_hash(string)
			Digest::SHA2.hexdigest(string)
		end

end

# == Schema Information
#
# Table name: users
#
#  id                 :integer(4)      not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#  encrypted_password :string(255)
#  salt               :string(255)
#  admin              :boolean(1)      default(FALSE)
#


