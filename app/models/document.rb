class Document < ActiveRecord::Base
  def to_json
    ActiveSupport::JSON.decode(data).merge('_id' => name, '_rev' => revision).to_json
  end
end
