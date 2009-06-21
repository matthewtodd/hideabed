class DesignsController < DocumentsController
  def document_name
    "_design/#{super}"
  end
end