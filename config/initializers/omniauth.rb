OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '415107655205362', 'c24d6dd5688d4886b68b45d15051f9f4'
end


