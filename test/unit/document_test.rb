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

  context 'a saved document' do
    setup do
      @document = Document.make
    end

    should 'accept update given revision_confirmation' do
      assert @document.update_attributes(:revision_confirmation => @document.revision, :data => {})
    end

    should 'reject update with nil revision_confirmation' do
      assert !@document.update_attributes(:revision_confirmation => 'unspecified', :data => {})
    end
  end
end
