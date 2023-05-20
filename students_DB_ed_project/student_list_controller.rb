require_relative "student_list_view"
require_relative "student_list"
#require "json_reader_writer.rb"
require_relative "db_singleton"
require_relative 'DB_format'

class StudentListController
	def initialize(view)
		# Спроси зачем
		self.view = view
		self.list = StudentList.new
		self.list.format = DBFormat.new
		self.load_list
		self.data_list_student_short = self.list.get_k_n_student_short_list(k:0, n:self.table_row_count)
		
		self.data_list_student_short.view = self.view
	end

	private
	attr_accessor :view, :list, :data_list_student_short

end