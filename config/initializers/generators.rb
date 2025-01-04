Rails.application.config.generators do |g|
  g.test_framework :rspec
  g.factory_bot suffix: "factory"
end
