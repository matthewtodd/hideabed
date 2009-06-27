module View
  def view(functions)
    rows = Mapper.new(functions['map']).map(all)
    { :total_rows => rows.size, :offset => 0, :rows => rows }
  end

  private

  class Mapper
    def initialize(function)
      @function = Doily(function)
    end

    def map(documents)
      @rows = []
      documents.each do |document|
        @current_document = document
        @function.delegate(self).call(document.data)
      end
      @rows
    end

    def emit(key, value)
      @rows.push(:id => @current_document.name, :key => key, :value => value)
    end
  end
end