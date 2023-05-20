require_relative 'data_list'
class DataListStudentShort < DataList

  attr_accessor :view

  def notify
    self.view.set_table_params(self.get_objects_attr_names.map{|x| x.to_s}, self.list.size)
    self.view.set_table_data(self.get_data)
  end

  private
  def get_objects_attr(obj)
    return [obj.surname_with_initials, obj.github_username, obj.contact]
  end

  def get_objects_attr_names
    return ["surname_with_initials", "github_username", "contact"]
  end

end