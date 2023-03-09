require_relative "student"

student1 = Student.new id:1, name: "Александр", surname: "Пушкин", patronymic: "Сергеевич"
student2 = Student.new id:2, name: "Александр", surname: "Мищенко", patronymic: "Николаевич", phone: "79334523547"
student3 = Student.new id:3, name: "Артем", surname: "Нагалевский", patronymic: "Михайлович", phone: "79334523548", github_username: "nullexpdirector", email:"nullexp@mail.ru", telegram_username:"@nullexpdirector"

puts student1
puts student2
puts student3