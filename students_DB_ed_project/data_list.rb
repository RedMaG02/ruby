class DataList
  private
  attr_writer :list

  protected
  attr_reader :list
  attr_accessor :selected
  def initialize(list:)
    self.list = list
  end

  def select(number)
    self.selected.append(self.list[number])
    return nil
  end

  def get_selected
    return self.selected
  end

  def get_names
  end

  def get_data
  end

end