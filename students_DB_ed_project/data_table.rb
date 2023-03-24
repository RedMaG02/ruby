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
end