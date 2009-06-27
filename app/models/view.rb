module View
  def view(functions)
    rows = Mapper.new(functions['map']).map(all)
    { :total_rows => rows.size, :offset => 0, :rows => rows }
  end

  private

  class Mapper
    def initialize(function_string)
      @function = Doily(function_string).delegate(self)
    end

    def map(records)
      @results = []
      records.each do |record|
        @current_record = record
        @function.call(record)
      end
      @results
    end

    def emit(key, value)
      @results << { :id => @current_record.name, :key => key, :value => value }
    end
  end
end