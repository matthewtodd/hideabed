class Document < ActiveRecord::Base
  before_save :update_revision, :unless => :revision_changed? # the unless clause allows setting up a revision in a test
  serialize   :data

  def to_json(options)
    data.merge(:_id => name, :_rev => revision).to_json(options)
  end

  def views
    data.fetch('views').tap do |views|
      # look like ActiveRecord, not a Hash. Hinky?
      views.metaclass.send(:alias_method, :find_by_name!, :fetch)
    end
  end

  private

  def update_revision
    self.revision = ActiveSupport::SecureRandom.hex(16)
  end
end
