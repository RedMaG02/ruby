class DataTable
  private
  attr_accessor :table

  public
  def initialize(table:)
    self.table = table
  end

  def get_element(row:, col:)
    return self.table[row][col]
  end

  def get_rows_number
    return self.table.size
  end

  def get_cols_number
    return 0 if table.size == 0
    return self.table[0].size
  end
end