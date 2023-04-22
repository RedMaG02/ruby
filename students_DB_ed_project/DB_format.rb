class DBFormat < BasicFormat
  require_relative 'basic_format'
  require 'mysql2'
  require_relative 'db_singleton'

  private
  def text_to_hash(str: )
    return  JSON.parse(str)
  end

  def hash_to_format(hash: )
    values = hash.map { |h|
      h.values.join ","
    }.map { |str|
      "(#{str})"
    }.join(",")
    return values
  end

  def read_file(rfile:)
    results = client.query("SELECT * FROM students", symbolize_keys: true)
    return JSON.pretty_generate(results)
  end

  def write_file(wfile:, data:)
      insert_query = "insert into students values #{data}"
      self.client.query insert_query
  end

  attr_accessor client = DBSingleton.instance.db_client

end