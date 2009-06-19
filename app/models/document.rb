class Document < ActiveRecord::Base
  # :unless => :revision_changed? so that we can specify revisions in tests.
  before_save :update_revision, :unless => :revision_changed?
  serialize   :data

  def to_json
    data.merge(:_id => name, :_rev => revision).to_json
  end

  private

  def update_revision
    # this should probably be a hash of data and updated_at and...
    self.revision = ActiveSupport::SecureRandom.hex(16)
  end
end
