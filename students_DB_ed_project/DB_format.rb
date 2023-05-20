require_relative 'basic_format'
class DBFormat < BasicFormat

  require 'mysql2'
  require 'json'
  #require_relative 'db_singleton'

  private
  def text_to_hash(str: )
    return  JSON.parse(str, {:symbolize_names => true })
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
    results = client.query("SELECT * FROM students", symbolize_keys: true).to_a
    #puts(results)
    return JSON.generate(results)
  end

  def write_file(wfile:, data:)
      insert_query = "insert into students values #{data}"
      self.client.query insert_query
  end
  public
  attr_accessor :client
  def initialize
    self.client = Mysql2::Client.new(
      host: 'localhost',
      username: 'RedMaG',
      password: '159875326',
      database: 'ruby_student'
    )
  end



end