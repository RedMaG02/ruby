class TXTFormat < BasicFormat
  require_relative 'basic_format'
  require_relative 'parser'

  extend(Parser)

  def text_to_hash(str: )
    lines = parse_txt(str: str, separator: "\n")
    hash_array = lines.map{|line| parse(str:line, separator:";", pair_separator: ":", fields_for_parsing: [:id, :name, :surname, :patronymic, :phone, :telegram_username, :email, :github_username])}
    return hash_array
  end

  def hash_to_format(hash_array: )
    string_array = hash_array.map{|hash| get_string(hash:hash)}
    return write_txt(separator: "\n", string_array:string_array)
  end

  private
  def get_string(hash: )
    id ="id:#{hash[:id]};"
    surname ="surname:#{hash[:surname]};"
    name ="name:#{hash[:name]};"
    patronymic ="patronymic:#{hash[:patronymic]};"
    phone ="phone:#{hash[:phone]};"
    telegram_username ="telegram_username:#{hash[:telegram_username]};"
    email ="email:#{hash[email]};"
    github_username ="github_username:#{hash[:github_username]}"

    return [id, surname, name, patronymic, phone, telegram_username, email, github_username].join

  end

end