class Student

    attr_accessor :id, :name, :surname, :patronymic, :phone, :telegram_username, :email, :github_username

    def phone= value

        if valid_phone?(value)
            @phone = value
        else
            raise StandartError.new "Phone in uncorrect format"
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

    def valid_phone?(phone)

        valid_reg = \d{11}
        return phone =~ valid_reg

    end

end