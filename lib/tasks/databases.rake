namespace :db do
  desc 'Writes out a basic sqlite3 database.yml.'
  task :yml do
    path = Rails.root.join('config', 'database.yml')
    unless path.exist?
      config = {}
      %w(development test).each { |env| config[env] = { 'adapter' => 'sqlite3', 'database' => "db/#{env}.sqlite3" } }
      path.open('w') { |io| YAML.dump(config, io) }
    end
  end
end