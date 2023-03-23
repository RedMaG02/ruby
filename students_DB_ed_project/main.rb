require_relative "student"

student1 = Student.new id:"1", name: "Александр", surname: "Пушкин", patronymic: "Сергеевич"
student2 = Student.new id:"2", name: "Александр", surname: "Мищенко", patronymic: "Николаевич", phone: "79334523547"
student3 = Student.new name: "Артем", surname: "Нагалевский", patronymic: "Михайлович", id:"3", phone: "79334523548", github_username: "nullexpdirector", email:"nullexp@mail.ru", telegram_username:"@nullexpdirector"
student4 = Student.new name: "Артемc", surname: "Нагалевскийc", patronymic: "Михайловичc", ** {:id => "4", :phone => "79334523544"}
puts student1
puts student2
puts student3
puts student4

puts student1.surname.nil?