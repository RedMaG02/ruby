class StudentsListTXT < BasicStudentList
  require_relative 'basic_student_list'
  require_relative 'student'

  def read_student_list
    self.list = Student.read_from_txt(file:self.file)
    return nil
  end

  def write_student_list
    Student.write_to_txt(file:self.file, students_array: self.list)
    return nil
  end

end