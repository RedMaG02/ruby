require "mysql2"

class DBSingleton
  private_class_method :new

  attr_accessor :db_client
  private :"db_client="

  def initialize
    self.db_client = Mysql2::Client.new(host: "localhost",
                                        username: "RedMaG",
                                        database: "ruby_student")
  end

  @instance = new

  def self.instance
    @instance
  end
end
