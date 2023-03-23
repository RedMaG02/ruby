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
        self.phone = phone
        self.telegram_username = telegram_username
        self.email = email
        self.github_username = github_username
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

    #Returns hash from object of class Student in string form. *For constructor
    def self.parse_object_string(str)
        raise ArgumentError.new("Must be string") unless str.is_a? String
        tokens = str.split(";")
        fields_for_parsing = [:id, :name, :surname, :patronymic, :phone, :telegram_username, :email, :github_username]

        raise ArgumentError.new("Wrong number of fields") unless tokens.size == fields_for_parsing.size
        tokens.last.chomp!("$")

        pair_array = tokens.map  { |field|
            pair = field.split(":")
            pair[0] = pair[0].to_sym
            if pair[1] == "" then pair[1] = nil end
            pair}

        pair_array.each { |pair| raise ArgumentError.new("Wrong field name")  unless fields_for_parsing.include?(pair[0])}

        return pair_array.to_h
    end

    def self.student_from_string_ctor(obj)
        hash_obj = Student.parse_object_string(obj)
        Student.new(**hash_obj)
    end
end