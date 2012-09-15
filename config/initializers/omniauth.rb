OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '409441195770696', 'c62a0b2760e93c17b5d22fc34fae0966'
end


