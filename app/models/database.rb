class Database < ActiveRecord::Base
  has_many :documents, :dependent => :destroy, :extend => View

  validates_format_of :name, :with => %r{^[a-z0-9_$()+-/]+$}
  validates_uniqueness_of :name

  def view(design_name, view_name)
    design = documents.find_by_name!("_design/#{design_name}")
    view   = design.views.find_by_name!(view_name)
    documents.view(view)
  end

  def to_json
    JSON[:db_name => name]
  end
end
