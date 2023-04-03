class JSONFormat < BasicFormat
  require_relative 'basic_format'
  require 'json'

  def text_to_hash(str: )
    return  JSON.parse(str)
  end

  def hash_to_format(hash: )
    return JSON.pretty_generate(hash)
  end

end