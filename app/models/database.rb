class Database < ActiveRecord::Base
  validates_format_of :name, :with => %r{^[a-z0-9_$()+-/]+$}
  validates_uniqueness_of :name
end
