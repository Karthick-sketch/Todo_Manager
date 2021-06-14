class TodosController < ApplicationController
  def index
    @todos = current_user.todos
    render "index"
  end

  def create
    new_todo = Todo.new(
      todo_text: params[:todo_text],
      due_date: params[:due_date],
      completed: false,
      user_id: current_user.id,
    )

    unless new_todo.save
      flash[:error] = new_todo.errors.full_messages.join(", ")
    end

    redirect_to todos_path
  end

  def update
    completed = params[:completed]
    todo = current_user.todos.find(params[:id])
    todo.completed = completed
    todo.save!
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = current_user.todos.find(id)
    todo.destroy
    redirect_to todos_path
  end
end