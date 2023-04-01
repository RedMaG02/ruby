require_relative "basic_student"
#TODO Do something with separators in to_s, write_to_txt, read_from_txt_ctor
class Student < BasicStudent
    attr_reader  :name, :surname, :patronymic, :phone, :telegram_username, :email

    def phone=(value)

        if value != nil
            if Student.valid_phone?(value)
                @phone = value
            else
                raise ArgumentError.new("phone in wrong format")
            end
        else
            @phone = nil
        end

    end

    def name=(value)

        if Student.valid_name?(value)
            @name = value
        else
            raise ArgumentError.new("name in wrong format")
        end

    end

    def surname=(value)

        if Student.valid_surname?(value)
            @surname = value
        else
            raise ArgumentError.new("surname in wrong format")
        end

    end

    def patronymic=(value)

        if Student.valid_patronymic?(value)
            @patronymic = value
        else
            raise ArgumentError.new("patronymic in wrong format")
        end

    end

    def telegram_username=(value)

        if value != nil
            if Student.valid_telegram_username?(value)
                @telegram_username = value
            else
                raise ArgumentError.new("telegram_username in wrong format")
            end
        else
            @telegram_username = nil
        end

    end

    def email=(value)

        if value != nil
            if Student.valid_email?(value)
                @email = value
            else
                raise ArgumentError.new("email in wrong format")
            end
        else
            @email = nil
        end

    end

    def initialize(id:nil, name:, surname:, patronymic:, phone:nil, telegram_username:nil, email:nil, github_username:nil)
        self.id = id
        self.name = name
        self.surname = surname
        self.patronymic = patronymic
        #self.phone = phone
        #self.telegram_username = telegram_username
        #self.email = email
        self.github_username = github_username
        self.set_contacts!(phone: phone, telegram_username: telegram_username, email: email)
    end

    def to_s
        id ="id:#{self.id};"
		    surname ="surname:#{self.surname};"
		    name ="name:#{self.name};"
		    patronymic ="patronymic:#{self.patronymic};"
		    phone ="phone:#{self.phone};"
		    telegram_username ="telegram_username:#{self.telegram_username};"
		    email ="email:#{self.email};"
		    github_username ="github_username:#{self.github_username}"

        return [id, surname, name, patronymic, phone, telegram_username, email, github_username].join

    end


    def contact_exist?
        contacts = [self.telegram_username, self.phone, self.email]
        contacts.each{|contact| unless contact.nil? then (return true) end}
        return false
    end

    #Returns true if exists github_username and any contact
    def validate?
        return (github_username_exist? and contact_exist?)
    end

    # sets email, phone, telegram_username values. Ignores nil values.
    def set_contacts!(email:nil, phone:nil, telegram_username:nil)
        self.email = email unless email.nil?
        self.phone = phone unless phone.nil?
        self.telegram_username = telegram_username unless telegram_username.nil?
    end

    #Constructor from string
    def self.student_from_string_ctor(obj)
        hash_obj = parse(str:obj, separator:";", pair_separator: ":", fields_for_parsing: [:id, :name, :surname, :patronymic, :phone, :telegram_username, :email, :github_username])
        Student.new(**hash_obj)
    end

    #Returns str[0] + "." Like: str = "Arseniy" -> "A."
    def self.get_initials(str)
        return str[0] + "."
    end

    #Returns github_username or "NO_GIT" if github_username doesnt exist
    def get_github_username
        if github_username_exist? then
            return self.github_username
        else
            raise StandardError.new("GIT DOES NOT EXIST") #I dont know what to do
        end
    end

    #Returns string: "contact_name:value" with first(in contacts Array) existing contact, if contacts doesnt exist returns "NO_CONTACTS"
    def get_contact
        if contact_exist? then
            contacts = [self.telegram_username, self.phone, self.email]
            contacts_names = ["telegram_username", "phone", "email"]
            contacts.each_index { |index| unless contacts[index].nil? then return "contact:#{contacts_names[index]}-#{contacts[index]}" end}
        else
            raise StandardError.new("GIT DOES NOT EXIST") #I dont know what to do
        end

    end

    #Returns string with surname, initials of name and patronymic, github_username and 1 contact, like: "surname_In1_In2:SURNAME M.N.;@github;phone:79959949596"
    def get_info
        info = "surname_with_initials:#{self.surname} #{Student.get_initials(self.name)}#{Student.get_initials(self.patronymic)};"
        info += "github_username:#{get_github_username};"
        info += get_contact
        return info

    end

    def self.read_from_txt_ctor(file:)
        obj_str_array = parse_txt(file:file)
        student_obj_array = obj_str_array.map{|obj| Student.student_from_string_ctor(obj)}
        return student_obj_array
    end

    def self.write_to_txt(file:, students_array:)
        students_string_array = students_array.map {|student| student.to_s}
        write_txt(file:file, string_array:students_string_array)
        nil
    end

end