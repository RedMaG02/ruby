class StudentShort
  extend(Parser)
  require_relative "Student"

  attr_reader :id, :surname_with_initials, :github_username, :contact
  attr_writer :id, :surname_with_initials, :github_username, :contact

  def id=(value)
    if @id == nil
      if Student.valid_id?(value)
        @id = value
      else
        raise ArgumentError.new("id in wrong format")
      end
  end

  def github_username=(value)

    if @github_username == nil
      if Student.valid_github_username?(value)
        @github_username = value
      else
        raise ArgumentError.new("github_username in wrong format")
      end

    end

    def surname_with_initials=(value)
      if @surname_with_initials == nil
        if StudentShort.valid_surname_with_initials?(value)
          @surname_with_initials = value
        else
          raise ArgumentError.new("surname_with_initials in wrong format")
        end
    end

    def self.valid_surname_with_initials?(value)

      valid_reg = /\A[A-Яа-я]+\s+[А-Яа-я]\.[А-Яа-я]\.\z/
      return value =~ valid_reg

    end

    def contact=(value)
      
    end
      if @contact == nil
        contact_pair = value.split("-")
        contact_pair[0].to_sym
        hash = {telegram_username: Student.valid_telegram_username?(contact_pair[1]), phone: Student.valid_phone?(contact_pair[1]), email: Student.valid_email?(contact_pair[1])}
        hash[contact_pair[0]].call(contact_pair[1])
        @contact = "#{contact_pair[0]}:#{contact_pair[1]}"
      end

    end



  def initialize(id:nil, str:)
    self.id = id
    hash = Parser.parse(str,";", ":", [:surname_with_initials,:github_username, :contact])
    self.github_username = hash[:github_username]
    self.surname_with_initials = hash[:surname_with_initials]
    self.contact = hash[:contact]
  end

  def self.from_student_ctor(student)
    unless student.is_a? Student then raise ArgumentError.new("value must be Student object") end
    student_string = student.get_info
    StudentShort.new(id:student.id, str:student_string)
  end
end