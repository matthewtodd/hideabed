Then /^I should see json '(.*)'$/ do |json|
  response.body.should == json
end