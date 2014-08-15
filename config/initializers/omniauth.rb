Rails.application.config.middleware.use OmniAuth::Builder do
  provider :jawbone, 
    ENV['zsoPnAO4XOU'], 
    ENV['7ffa7f96bc73fc2e5335c9c5e19673c5eba97b92'], 
    :scope => "basic_read mood_read"
end