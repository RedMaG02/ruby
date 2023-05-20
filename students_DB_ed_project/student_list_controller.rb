require_relative "student_list_view"
require_relative "student_list"
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

	def cur_page
		if @cur_page.nil? or @cur_page <= 1 or @cur_page > self.page_count then @cur_page = 1 end

		@cur_page
	end

	def del_selected
		id_array = self.data_list_student_short.get_selected

		id_array.each do |id|
			self.list.delete_student(id: id)
		end
	end

	def unselect
		self.data_list_student_short.unselect
	end

	def select(id)
		self.data_list_student_short.select(id)
	end

	def page_count
		if not self.list.nil? then
			(self.list.student_count.to_f / self.table_row_count).ceil
		else
			1
		end
	end

	def next_page
		self.cur_page += 1
	end

	def prev_page
		self.cur_page -= 1
	end

	def refresh_data(reload: false)
		if(reload) then
			self.load_list()
		end

		self.list.get_k_n_student_short_list(k:self.cur_page - 1, n:self.table_row_count, data_list: data_list_student_short)

		self.data_list_student_short.notify
	end

	def sort
		self.list.sort_si
	end


	private
	attr_accessor :view, :list, :data_list_student_short

	def table_row_count; 10 end

	def last_page?(page)
		page >= self.page_count
	end

	def first_page?(page)
		page <= 1
	end

	def cur_page=(value)
		if last_page?(value) then
			@cur_page = self.page_count
		elsif first_page?(value) then
			@cur_page = 1
		else
			@cur_page = value
		end
	end

	def load_list
			self.list.read_student_list
		puts(self.list.list)
	end
end