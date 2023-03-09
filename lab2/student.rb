class Student

    attr_accessor :id, :name, :surname, :patronymic, :phone, :telegram_username, :email, :github_username

    def phone= value

        if valid_phone?(value)
            @phone = value
        else
            raise StandartError.new "phone in uncorrect format"
        end

    end

    def id= value

        if valid_id?(value)
            @id = value
        else
            raise StandartError.new "id in uncorrect format"
        end

    end

    def name= value

        if valid_name?(value)
            @name = value
        else
            raise StandartError.new "name in uncorrect format"
        end

    end

    def surname= value

        if valid_surname?(value)
            @surname = value
        else
            raise StandartError.new "surname in uncorrect format"
        end

    end

    def patronymic= value

        if valid_patronymic?(value)
            @patronymic = value
        else
            raise StandartError.new "patronymic in uncorrect format"
        end

    end

    def telegram_username= value

        if valid_telegram_username?(value)
            @telegram_username = value
        else
            raise StandartError.new "telegram_username in uncorrect format"
        end

    end

    def email= value

        if valid_email?(value)
            @email = value
        else
            raise StandartError.new "email in uncorrect format"
        end

    end

    def github_username= value

        if valid_github_username?(value)
            @github_username = value
        else
            raise StandartError.new "github_username in uncorrect format"
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

    def valid_phone?(value)

        valid_reg = \d{11}
        return value =~ valid_reg

    end

    def valid_name?(value)

        valid_reg = /^[а-яА-Яa-zA-Z]+$/
        return value =~ valid_reg

    end

    def valid_surname?(value)

        valid_reg = /^[а-яА-Яa-zA-Z]+$/
        return value =~ valid_reg

    end

    def valid_patronymic?(value)

        valid_reg = /^[а-яА-Яa-zA-Z]+$/
        return value =~ valid_reg

    end

    def valid_telegram_username?(value)

        valid_reg = /^\@[a-zA-Z]([a-zA-Z]|\d|_){4,32}$/
        return value =~ valid_reg

    end

    def valid_github_username?(value)

        valid_reg = /^[a-zA-Z0-9]+$/
        return value =~ valid_reg

    end

    def valid_email?(value)

        valid_reg = /^[a-zA-Z0-9._]+\@[a-zA-Z0-9.]+\.[a-z]+$/
        return value =~ valid_reg

    end

    def valid_id?(value)

        valid_reg = \d+
        return value =~ valid_reg

    end

end