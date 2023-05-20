require_relative 'data_table'
class DataList
  private
  attr_accessor :selected
  attr_accessor :arary
  public
  attr_accessor :list


  def initialize(list:)
    self.list = list
    self.arary = []
    # @observers = []
  end

  #def add_observer(observer)
  # @observers.append(observer)
  #end

  # def notify
  # @observers.each { |observer| observer.on_datalist_changed(get_data) }
  #end

  #def select(number)
  #  self.selected.append(self.list[number])
  #  return nil
  #end

  #def get_selected
  #  temp = self.selected
  #  self.selected = []
  #  return temp
  #end

  def select(num)
    self.arary.append(self.list[num].id)
  end

  # Наверное, такой метод должен быть
  def unselect
    self.arary = []
  end

  def get_selected
    self.arary
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

  #def replace_objects(list)
  #  self.list=list.dup
  #end

  protected

  def get_objects_attr(obj)
    return []
  end
  def get_objects_attr_names()
    return []
  end


end