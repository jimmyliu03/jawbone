Rails.application.config.middleware.use OmniAuth::Builder do
  provider :jawbone, 
    'zsoPnAO4XOU', 
    '7ffa7f96bc73fc2e5335c9c5e19673c5eba97b92', 
    :scope => "basic_read extended_read location_read friends_read mood_read mood_write move_read move_write sleep_read sleep_write meal_read meal_write weight_read weight_write generic_event_read generic_event_write"
end