Given /^these (.+)$/ do |model, table|
  table.hashes.each do |hash|
    model.classify.constantize.make(hash)
  end
end

When /^I (get|put|delete) (\S+)(.+)?$/ do |method, path, data|
  visit path, method, data
end

Then /^I should see status (\d+.*)$/ do |status|
  response.status.should == status
end

Then /^I should see json '(.*)'$/ do |json|
  response.body.should == json
end