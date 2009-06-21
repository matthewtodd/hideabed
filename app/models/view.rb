module View
  def view(functions)
    reduce_javascript(functions['reduce'], map_javascript(functions['map'], all))
  end

  private

  def map_javascript(function, records)
    records
  end

  def reduce_javascript(function, rows)
    { :total_rows => rows.size, :offset => 0, :rows => rows }
  end
end