require_relative "student"
require_relative "basic_student"
require_relative "parser"
require_relative 'student_short'
require_relative 'data_list_student_short'
require_relative 'TXT_format'
require_relative 'DB_format'
require 'mysql2'
require 'fox16'
require_relative 'student_list_controller'
require_relative 'student_list_view'
require_relative 'student_main_window'


extend(Parser)

include Fox


#student1 = Student.new id:"1", name: "Александр", surname: "Пушкин", patronymic: "Сергеевич"
#student2 = Student.new id:"2", name: "Александр", surname: "Мищенко", patronymic: "Николаевич", phone: "79334523547"
#student3 = Student.student_from_string_ctor("id:3;surname:Нагалевский;name:Артем;patronymic:Михайлович;phone:79334523548;telegram_username:@nullexpdirector;email:nullexp@mail.ru;github_username:nullexpdirector")
#student4 = Student.new name: "Артемc", surname: "Нагалевскийc", patronymic: "Михайловичc", ** {:id => "4", :phone => "79334523544"}
#puts student1
#puts student2
#puts student3
#puts student4

#puts student1.surname.nil?

#tokens = ["one:1", "two:2"]

#pair_array = tokens.map  { |field|
#  pair = field.split(":")
#  pair[0] = pair[0].to_sym()
#  if pair[1] == "" then pair[1] = nil end
#  pair}

#puts(pair_array[0][0])

#Student.write_to_txt(file:"write_test.txt", students_array:Student.read_from_txt_ctor(file:"test.txt"))
#puts(Student.read_from_txt_ctor(file:"write_test.txt"))

#stud1 = Student.student_from_string_ctor("id:3;surname:НагалевскиI;name:Артем;patronymic:Михайлович;phone:79334523548;telegram_username:@nullexpdirector;email:nullexp@mail.ru;github_username:nullexpdirector")
#stud2 = Student.student_from_string_ctor("id:4;surname:НагалевскийII;name:Артем;patronymic:Михайлович;phone:79334523548;telegram_username:@nullexpdirector;email:nullexp@mail.ru;github_username:nullexpdirector")
#stud3 = Student.student_from_string_ctor("id:5;surname:НагалевскийIII;name:Артем;patronymic:Михайлович;phone:79334523548;telegram_username:@nullexpdirector;email:nullexp@mail.ru;github_username:nullexpdirector")

#short_stud1 = StudentShort.from_student_ctor(stud1)
#short_stud2 = StudentShort.from_student_ctor(stud2)
#short_stud3 = StudentShort.from_student_ctor(stud3)

#list = DataListStudentShort.new(list: [short_stud1, short_stud2, short_stud3])
#puts(list.get_names)
#puts(list.get_data)
#test = StudentsListTXT.new()
#list = test.read_student_list
#list.append("не пикачу")
#puts(list)
#puts(test.list)
#client = Mysql2::Client.new(
  #    host: 'localhost',
#  username: 'RedMaG',
#  password: '159875326',
#  database: 'ruby_student'
#)
#client.

#results = client.query("SELECT * FROM students", symbolize_keys: true)

#results.each { |r|
  #puts Student.new(**r)
  #puts
  #}

#app = FXApp.new
#Window.new(app)
#app.create
#app.run
StudentListView.new