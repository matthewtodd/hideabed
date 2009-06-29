class Document < ActiveRecord::Base
  before_save :update_revision
  serialize :data
  validates_confirmation_of :revision, :on => :update

  def views
    data.fetch('views').tap do |views|
      # look like ActiveRecord, not a Hash. Hinky?
      views.metaclass.send(:alias_method, :find_by_name!, :fetch)
    end
  end

  def to_json(options={})
    JSON[data.merge(:_id => name, :_rev => revision)]
  end

  private

  def update_revision
    self.revision = ActiveSupport::SecureRandom.hex(16) unless revision_changed?
  end
end
