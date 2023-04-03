require_relative 'data_table'
class DataList
  private
  attr_accessor :selected

  public
  attr_accessor :list

  def initialize(list:)
    self.list = list
  end

  def select(number)
    self.selected.append(self.list[number])
    return nil
  end

  def get_selected
    temp = self.selected
    self.selected = []
    return temp
  end

  def get_names
    return ["№", *get_objects_attr_names]
  end

  def get_data
    table = []
    counter = 0
    list.each { |obj| table.append([counter, *get_objects_attr(obj)]); counter += 1}
    return DataTable.new(table: table)
  end

  protected

  def get_objects_attr(obj)
    return []
  end
  def get_objects_attr_names()
    return []
  end


end