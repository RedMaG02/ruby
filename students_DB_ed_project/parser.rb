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
      if pair[1] == "" then pair[1] = nil end
      pair}

    pair_array.each { |pair| raise ArgumentError.new("Wrong field name")  unless fields_for_parsing.include?(pair[0])}

    return pair_array.to_h
  end

end