class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render "index"
  end

  def show
    render "todo"
  end

  def create
    Todo.create!(
      todo_text: params[:todo_text],
      due_date: DateTime.parse(params[:due_date]),
      completed: false,
    )
    render plain: "Hey, you are new todo is created with the id #{Todo.last.id}"
  end

  def update
    completed = params[:completed]
    todo = Todo.find(params[:id])
    todo.completed = completed
    todo.save!
    render plain: "Upload todo completed status to #{completed}"
  end
end
