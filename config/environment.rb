# Load the Rails application.
require_relative 'application'

#Load app's custom environment variables here, before environment/*.rb
smtp_env_vars = File.join(Rails.root, 'config', 'initializers', 'smtp_env_vars.rb')
load(smtp_env_vars) if File.exist?(smtp_env_vars)

#load test_set.rb
app_test = File.join(Rails.root, 'config', 'test_set.rb')
load(app_test) if File.exist?(app_test)

# Initialize the Rails application.
Rails.application.initialize!
