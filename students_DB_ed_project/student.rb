class Student

    attr_accessor :id, :name, :surname, :patronymic, :phone, :telegram_username, :email, :github_username

    def phone= value

        if value != nil
            if valid_phone?(value)
                @phone = value
            else
                raise ArgumentError.new("phone in uncorrect format")
            end
        else
            @phone = nil
        end

    end

    def id= value

        if value != nil
            if valid_id?(value)
                @id = value
            else
                raise ArgumentError.new("id in uncorrect format")
            end
        else
            @id = nil
        end

    end

    def name= value

        if valid_name?(value)
            @name = value
        else
            raise ArgumentError.new("name in uncorrect format")
        end

    end

    def surname= value

        if valid_surname?(value)
            @surname = value
        else
            raise ArgumentError.new("surname in uncorrect format")
        end

    end

    def patronymic= value

        if valid_patronymic?(value)
            @patronymic = value
        else
            raise ArgumentError.new("patronymic in uncorrect format") 
        end

    end

    def telegram_username= value

        if value != nil
            if valid_telegram_username?(value)
                @telegram_username = value
            else
                raise ArgumentError.new("telegram_username in uncorrect format")
            end
        else
            @telegram_username = nil  
        end  

    end

    def email= value

        if value != nil
            if valid_email?(value)
                @email = value
            else
                raise ArgumentError.new("email in uncorrect format")
            end
        else
            @email = nil  
        end

    end

    def github_username= value

        if value != nil
            if valid_github_username?(value)
                @github_username = value
            else
                raise ArgumentError.new("github_username in uncorrect format")
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
        id ="ID:#{self.id}; "
		surname ="SURNAME:#{self.surname}; "
		name ="NAME:#{self.name}; "
		patronymic ="PATRONYMIC:#{self.patronymic}; "
		phone ="PHONE:#{self.phone}; "
		telegram_username ="TELEGRAM_USERNAME:#{self.telegram_username}; "
		email ="EMAIL:#{self.email}; "
		github_username ="GITHUB_USERNAME:#{self.github_username}; "

        return [id, surname, name, patronymic, phone, telegram_username, email, github_username].compact.join

    end

    def self.valid_phone?(value)

        valid_reg = /\d{11}/
        return value =~ valid_reg

    end

    def self.valid_name?(value)

        valid_reg = /^[??-????-??a-zA-Z]+$/
        return value =~ valid_reg

    end

    def self.valid_surname?(value)

        valid_reg = /^[??-????-??a-zA-Z]+$/
        return value =~ valid_reg

    end

    def self.valid_patronymic?(value)

        valid_reg = /^[??-????-??a-zA-Z]+$/
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
        contacts = [self.telegram_username, self.phone, seld.email]
        contacts.each{|contact| if !contact.nil? then (return true) end}
        return false
    end

    #Returns true if exists github_username and any contact
    def validate?
        return (github_username_exist? and contact_exist?)
    end

    # sets email, phone, telegram_username values. Ignores nil values.
    def set_contacts!(email:nil, phone:nil, telegram_username:nil)
        self.email = email if !email.nil?
        self.phone = phone if !phone.nil? 
        self.telegram_username = telegram_username if !telegram_username.nil? 
    end
end