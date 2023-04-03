class YAMLFormat < BasicFormat
  require_relative 'basic_format'
  require 'yaml'

  def text_to_hash(str: )
    return  YAML.parse(str)
  end

  def hash_to_format(hash: )
    return hash.to_yaml
  end

end