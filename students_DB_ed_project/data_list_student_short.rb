require_relative 'data_list'
class DataListStudentShort < DataList
  def get_names
    return ["surname_with_initials", "github_username", "contact"]
  end

  def get_data
    table = []
    counter = 0
    list.each { |obj| table.append([counter, obj.surname_with_initials, obj.github_username, obj.contact]); counter += 1}
    return DataTable.new(table: table)
  end
end