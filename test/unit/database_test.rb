require 'test_helper'

class DatabaseTest < ActiveSupport::TestCase
  should_allow_values_for     :name, 'lowercase'
  should_not_allow_values_for :name, 'UPPERCASE'

  context 'with an existing Database' do
    setup { Database.create(:name => 'foo') }
    should_validate_uniqueness_of :name
  end
end
