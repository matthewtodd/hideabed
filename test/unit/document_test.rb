require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  context 'a new document' do
    setup { @document = Document.make_unsaved }

    should 'serialize data' do
      @document.data = Hash.new
      @document.save!
      assert_equal Hash.new, Document.find(@document.id).data
    end

    context 'saved' do
      setup { @document.save! }
      should_change '@document.revision'

      context 'twice' do
        setup { @document.save! }
        should_change '@document.revision'
      end
    end
  end
end
