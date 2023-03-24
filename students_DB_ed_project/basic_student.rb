class BasicStudent
  require_relative "parser"
  extend(Parser)
  attr_reader :id, :github_username

  def id=(value)

    if value != nil
      if BasicStudent.valid_id?(value)
        @id = value
      else
        raise ArgumentError.new("id in wrong format")
      end
    else
      @id = nil
    end

  end

  def github_username=(value)

    if value != nil
      if BasicStudent.valid_github_username?(value)
        @github_username = value
      else
        raise ArgumentError.new("github_username in wrong format")
      end
    else
      @github_username = nil
    end

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

end