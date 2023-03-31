require_relative 'data_list'
class DataListStudentShort < DataList

  private
  def get_objects_attr(obj)
    return [obj.surname_with_initials, obj.github_username, obj.contact]
  end

  def get_objects_attr_names()
    return ["surname_with_initials", "github_username", "contact"]
  end

end