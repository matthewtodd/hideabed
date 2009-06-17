Given /^these (.+)$/ do |model, table|
  table.hashes.each do |hash|
    model.classify.constantize.create!(hash)
  end
end

When /^I (get|put) (\S+)(.+)?$/ do |method, path, data|
  visit path, method, data
end

Then /^I should see json '(.*)'$/ do |json|
  response.body.should == json
end