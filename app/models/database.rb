class Database < ActiveRecord::Base
  has_many :documents, :extend => View

  validates_format_of :name, :with => %r{^[a-z0-9_$()+-/]+$}
  validates_uniqueness_of :name

  def to_json
    { :db_name => name }.to_json
  end
end
