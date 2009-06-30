RAILS_GEM_VERSION = '2.3.2' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Specify gems that this application depends on and have them installed with rake gems:install
  config.gem 'matthewtodd-doily', :lib => 'doily', :source => 'http://gems.github.com'

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  config.frameworks -= [ :active_resource, :action_mailer ]

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'UTC'

  config.after_initialize do
    Kernel.const_set('HIDEABED_API_KEY', ENV['HIDEABED_API_KEY'] || 'development_hideabed_api_key')
  end
end