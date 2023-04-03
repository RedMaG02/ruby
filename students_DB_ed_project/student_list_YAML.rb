class StudentsListYAML
  require_relative 'basic_student_list'
  require 'yaml'

  attr_accessor :list, :file

  def read_student_list
    file = File.open(self.file, "r")
    text = file.read
    yaml_hash = YAML.parse(text)
    self.list = yaml_hash.map {|hash| Student.new(**hash)}
    return nil
  end

  def write_student_list

    objects_array = self.list.map do |stud|
      arr = stud.map do |name, value|
        [name.to_s, value]
      end
      arr.to_h
    end

    yaml_text = objects_array.to_yaml
    file_text = File.open(file, "w")
    file_text.write(yaml_text)
    file_text.close
    return nil
  end

end