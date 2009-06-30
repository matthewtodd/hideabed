RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

def environment_variable(key)
  ENV[key.to_s.upcase] || "development_#{key}"
end

Rails::Initializer.run do |config|
  # Specify gems that this application depends on and have them installed with rake gems:install
  config.gem 'matthewtodd-doily', :lib => 'doily', :source => 'http://gems.github.com'

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  config.frameworks -= [ :active_resource, :action_mailer ]

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'

  # Your secret key for verifying cookie session data integrity. If you change
  # this key, all old sessions will become invalid! Make sure the secret is at
  # least 30 characters and all random, no regular words or you'll be exposed
  # to dictionary attacks.
  config.action_controller.session = {
    :key => '_hideabed_session',
    :secret => environment_variable(:hideabed_session_secret)
  }

  config.after_initialize do
    Kernel.const_set('HIDEABED_API_KEY', environment_variable(:hideabed_api_key))
  end
end
