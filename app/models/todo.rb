class Todo < ActiveRecord::Base
  def to_pleasant_string
    is_completed = completed ? "[X]" : "[ ]"
    "#{id}. #{is_completed} #{todo_text} #{due_date.to_s(:long)}"
  end
end
