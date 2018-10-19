class TodoList < ApplicationRecord
	belongs_to :user
	has_many :tasks	
	def self.all_todo_list_task
		TodoList.left_joins(:tasks).select("todo_lists.*, tasks.content as task").where(
		"todo_lists.id > 0 OR
		 tasks.todo_list_id = todo_lists.id"
		 )
	  end
	  def self.to_csv
	    CSV.generate do |csv|
		columns = %w(id title description task)
		csv << columns.map(&:humanize)
		all_todo_list_task.each do |student|
		  csv << student.attributes.values_at(*columns)
		end
	  end
	 end
end
