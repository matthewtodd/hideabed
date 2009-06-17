Given /^these databases$/ do |table|
  table.hashes.each do |hash|
    Database.create!(hash)
  end
end