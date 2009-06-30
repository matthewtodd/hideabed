namespace :heroku do
  task :gems => :environment do
    Rails.root.join('.gems').open('w') do |io|
      Rails.configuration.gems.each do |dependency|
        io.puts "#{dependency.name} #{(dependency.source.blank? ? '' : '--source ' + dependency.source)}"
      end
    end
  end
end
