require "student_list_view.rb"
require_relative 'student_list'

class StudentListController
  attr_accessor :view, :student_list

  def initialize(view)
    # Спроси зачем
    self.view = view
    self.list = StudentList.new
  end


end