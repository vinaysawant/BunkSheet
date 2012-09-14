class Fbuser < ActiveRecord::Base
  attr_accessible :name, :oauth_expires_at, :oauth_token, :provider, :uid
	has_many :schedules


	def self.from_omniauth(auth)
  	where(auth.slice(:provider, :uid)).first_or_initialize.tap do |fbuser|
  	  fbuser.provider = auth.provider
  	  fbuser.uid = auth.uid
  	  fbuser.name = auth.info.name
  	  fbuser.oauth_token = auth.credentials.token
  	  fbuser.oauth_expires_at = Time.at(auth.credentials.expires_at)
  	  fbuser.save!
  	end
	end

end

# == Schema Information
#
# Table name: fbusers
#
#  id               :integer(4)      not null, primary key
#  provider         :string(255)
#  uid              :string(255)
#  name             :string(255)
#  oauth_token      :string(255)
#  oauth_expires_at :datetime
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

