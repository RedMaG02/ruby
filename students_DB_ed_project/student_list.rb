class StudentList
  require_relative 'data_list_student_short'
  require_relative 'student_short'
  require_relative 'student'

  attr_accessor :list, :format

  public
  def initialize()
  end

  def read_student_list(rfile: nil)
    hash_array = format.file_data_to_hash(rfile:rfile)
    puts(hash_array)
    self.list = hash_array.map {|hash| Student.new(**hash)}
    return nil
  end

  def write_student_list(wfile: nil)
    #TODO move to function
    hash_array = get_hash_array()
    format.hash_to_file(wfile:wfile, data:hash_array)
    return nil
  end

  def get_student_by_id(id:)
    self.list.each {|stud| if stud.id == id then return stud end}
    return nil #return nil or raise error?
  end


  def get_k_n_student_short_list(k:, n:, data_list: nil)
    #accum_list = self.list[((k-1)*n)..(k*n)]
    accum_list = self.list[(k*n)...(k*n + n)]
    short_student_list = accum_list.map {|stud| StudentShort.from_student_ctor(stud)}

    if data_list.nil?
      return DataListStudentShort.new(list: short_student_list)
    else
      #Append to datalist or rewrite it?
      #short_student_list.each{|short_student| data_list.list.append(short_student)}
      data_list.list = short_student_list
      return data_list
    end

  end

  def sort_by_surname_initials
    self.list.sort_by{|obj| obj.get_surname_with_initials}
    return nil
  end


  def append_student(student: )
    student.id = get_id
    self.list.append(student)
    return nil
  end


  # new id? old id? which id?
  def replace_student(student: , id:)
    self.list.each_with_index do |stud, index|
      if (stud.id = id)
        student.id = id #?
        self.list[index] = student
      end
    end
    return nil
  end

  def delete_student(id: )
    self.list.each_with_index do |stud, index|
      if (stud.id = id)
        self.list.delete_at(index)
        return nil
      end
    end
  end

  def student_count
    return self.list.count
  end

  private
  def get_id
    existing_ids = self.list.map{|stud| return stud.id}
    id = 0
    while id in existing_ids
      id += 1
    end
    return id
  end

  def get_hash_array()
    hash_array = self.list.map do |stud|
      arr = stud.map do |name, value|
        [name.to_s, value]
      end
      arr.to_h
    end
    return hash_array
  end


end