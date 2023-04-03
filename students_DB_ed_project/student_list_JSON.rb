class StudentsListJSON
  require_relative 'basic_student_list'
  require 'json'
  def read_student_list
    file = File.open(self.file, "r")
    text = file.read
    json_hash = JSON.parse(text)
    self.list = json_hash.map {|hash| Student.new(**hash)}
    return nil
  end

  def write_student_list

    objects_array = self.list.map do |stud|
      arr = stud.map do |name, value|
        [name.to_s, value]
      end
      arr.to_h
    end

    json_text = JSON.pretty_generate(objects_array)
    file_text = File.open(file, "w")
    file_text.write(json_text)
    file_text.close
    return nil
  end

end