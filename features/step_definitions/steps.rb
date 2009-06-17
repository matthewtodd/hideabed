Given /^these databases$/ do |table|
  table.hashes.each { |hash| Database.make(hash) }
end

Given /^these documents$/ do |table|
  table.hashes.each do |hash|
    database = Database.find_by_name!(hash.delete('database'))
    database.documents.make(hash)
  end
end

When /^I (get|put|delete) (\S+)(.+)?$/ do |method, path, data|
  visit path, method, data
end

Then /^I should see status (\d+.*)$/ do |status|
  response.status.should == status
end

Then /^I should see json '(.*)'$/ do |json|
  ActiveSupport::JSON.decode(response.body).should == ActiveSupport::JSON.decode(json)
end