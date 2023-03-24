module Parser
  #Returns hash from string like: str = "name^pair_separator^name1^separator^surname^pair_separator^surname1"
  # separator - separator between key:value pairs
  # pair_separator - separator between key and value
  # field_for_parsing - array of symbols for parsing
  # Output hash format: {:name => "name1", :surname => "surname1"}
  # "" values becomes nil
  def parse(str:, separator:" ", pair_separator:";", fields_for_parsing:)
    raise ArgumentError.new("Must be string") unless str.is_a? String
    tokens = str.split(separator)
    raise ArgumentError.new("Wrong number of fields") unless tokens.size == fields_for_parsing.size

    pair_array = tokens.map  { |field|
      pair = field.split(pair_separator)
      pair[0] = pair[0].to_sym
      pair}
    pair_array.each{|pair| if pair.size == 1 then pair.append(nil) end}

    pair_array.each { |pair| raise ArgumentError.new("Wrong field name")  unless fields_for_parsing.include?(pair[0])}

    return pair_array.to_h
  end

  #Returns array of strings from txt file splitted with separator
  def parse_txt(file: , separator: "\n")
    file = File.open(file, "r")
    text = file.read
    str_array = text.split(separator)
    file.close
    return str_array
  end

  #Appends to given file strings from array with separator between them, doesnt append separator after last string, if file is not empty - appends separator before first string
  def write_txt(file: , separator: "\n" ,string_array:)
    file_text = File.open(file, "a")

    unless File.empty?(file_text)
      file_text.write(separator)
    end

    string_array.each_index {|index|
      if index != string_array.size-1
        file_text.write("#{string_array[index]}#{separator}")
      else
        file_text.write("#{string_array[index]}")
      end}
    file_text.close
  end

end