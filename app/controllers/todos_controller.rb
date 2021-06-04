# todos_controller.rb
class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    # render plain: Todo.order(:due_date).map { |todo| todo.to_pleasant_string }.join("\n")
    render "index"
  end

  def show
    # todo = Todo.find(params[:id])
    # render plain: todo.to_pleasant_string
    render "todo"
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])

    new_todo = Todo.create!(todo_text: todo_text, due_date: due_date, completed: false)
    # render plain: "Hey, you are new todo is created with the id #{new_todo.id}"
    redirect_to todos_path
  end

  def update
    completed = params[:completed]
    todo = Todo.find(params[:id])
    todo.completed = completed
    todo.save!
    render plain: "Upload todo completed status to #{completed}"
  end
end
