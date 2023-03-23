class Student

    attr_reader :id, :name, :surname, :patronymic, :phone, :telegram_username, :email, :github_username

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

    def id=(value)

        if value != nil
            if Student.valid_id?(value)
                @id = value
            else
                raise ArgumentError.new("id in wrong format")
            end
        else
            @id = nil
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

    def github_username=(value)

        if value != nil
            if Student.valid_github_username?(value)
                @github_username = value
            else
                raise ArgumentError.new("github_username in wrong format")
            end
        else
            @github_username = nil
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
		    github_username ="github_username:#{self.github_username}$"

        return [id, surname, name, patronymic, phone, telegram_username, email, github_username].join

    end

    def self.valid_phone?(value)

        valid_reg = /\d{11}/
        return value =~ valid_reg

    end

    def self.valid_name?(value)

        valid_reg = /^[а-яА-Яa-zA-Z]+$/
        return value =~ valid_reg

    end

    def self.valid_surname?(value)

        valid_reg = /^[а-яА-Яa-zA-Z]+$/
        return value =~ valid_reg

    end

    def self.valid_patronymic?(value)

        valid_reg = /^[а-яА-Яa-zA-Z]+$/
        return value =~ valid_reg

    end

    def self.valid_telegram_username?(value)

        valid_reg = /^\@[a-zA-Z]([a-zA-Z]|\d|_){4,32}$/
        return value =~ valid_reg

    end

    def self.valid_github_username?(value)

        valid_reg = /^[a-zA-Z0-9]+$/
        return value =~ valid_reg

    end

    def self.valid_email?(value)

        valid_reg = /^[a-zA-Z0-9._]+\@[a-zA-Z0-9.]+\.[a-z]+$/
        return value =~ valid_reg

    end

    def self.valid_id?(value)

        valid_reg = /\d+/
        return value =~ valid_reg

    end

    def github_username_exist?
        return !self.github_username.nil?
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


    #TODO: dont need it in Student class, make another class
    #Returns hash from object of class Student in string form. *For constructor
    def self.parse_object_string(str)
        raise ArgumentError.new("Must be string") unless str.is_a? String
        tokens = str.split(";")
        fields_for_parsing = [:id, :name, :surname, :patronymic, :phone, :telegram_username, :email, :github_username]

        raise ArgumentError.new("Wrong number of fields") unless tokens.size == fields_for_parsing.size
        #tokens.last.chomp!("$")

        pair_array = tokens.map  { |field|
            pair = field.split(":")
            pair[0] = pair[0].to_sym
            if pair[1] == "" then pair[1] = nil end
            pair}

        pair_array.each { |pair| raise ArgumentError.new("Wrong field name")  unless fields_for_parsing.include?(pair[0])}

        return pair_array.to_h
    end

    #Constructor from string
    def self.student_from_string_ctor(obj)
        hash_obj = Student.parse_object_string(obj)
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
            return "NO_GIT"
        end
    end

    #Returns string: "contact_name:value" with first(in contacts Array) existing contact, if contacts doesnt exist returns "NO_CONTACTS"
    def get_contact
        if contact_exist? then
            contacts = [self.telegram_username, self.phone, self.email]
            contacts_names = ["telegram_username", "phone", "email"]
            contacts.each_index { |index| unless contacts[index].nil? then return "#{contacts_names[index]}:#{contacts} " end}
        else
            return "NO_CONTACTS"
        end
    end
    #Returns string with surname, initials of name and patronymic, github_username and 1 contact, like: "SURNAME M.N. @github phone:79959949596"
    def get_info
        info = "#{self.surname} #{get_initials(self.name)}#{get_initials(self.patronymic)} "
        info += get_github_username + " "
        info += get_contact
        return info

    end

end