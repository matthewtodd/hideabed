Sham.database_name { |i| "database#{i}"}

Database.blueprint do
  name { Sham.database_name }
end