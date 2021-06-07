# todos_controller.rb
class TodosController < ApplicationController
  def index
    render "index"
  end

  def show
    render "todo"
  end

  def create
    todo_text = params[:todo_text]
    due_date = DateTime.parse(params[:due_date])

    new_todo = Todo.create!(todo_text: todo_text, due_date: due_date, completed: false)
    redirect_to todos_path
  end

  def update
    completed = params[:completed]
    todo = Todo.find(params[:id])
    todo.completed = completed
    todo.save!
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.find(id)
    todo.destroy
    redirect_to todos_path
  end
end
