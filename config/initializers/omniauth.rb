Storenvy_app_id = '482c6fa250ab2c84658994faf1c2048bdb76eacf07a4fc1412363629c55acc41'
Storenvy_secret = 'd96d1edba0df434225c2fdaf8eb84e6fbbc75ebc4fe8d4387231db600c5ec71a'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :storenvy, Storenvy_app_id, Storenvy_secret
end