require_relative "student"
require_relative "basic_student"

student1 = Student.new id:"1", name: "Александр", surname: "Пушкин", patronymic: "Сергеевич"
student2 = Student.new id:"2", name: "Александр", surname: "Мищенко", patronymic: "Николаевич", phone: "79334523547"
student3 = Student.student_from_string_ctor("id:3;surname:Нагалевский;name:Артем;patronymic:Михайлович;phone:79334523548;telegram_username:@nullexpdirector;email:nullexp@mail.ru;github_username:nullexpdirector")
student4 = Student.new name: "Артемc", surname: "Нагалевскийc", patronymic: "Михайловичc", ** {:id => "4", :phone => "79334523544"}
puts student1
puts student2
puts student3
puts student4

puts student1.surname.nil?

tokens = ["one:1", "two:2"]

pair_array = tokens.map  { |field|
  pair = field.split(":")
  pair[0] = pair[0].to_sym()
  if pair[1] == "" then pair[1] = nil end
  pair}

puts(pair_array[0][0])