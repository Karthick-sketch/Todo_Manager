class TodosController < ApplicationController
  def index
    @todos = Todo.of_user(current_user)
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
      user_id: current_user.id,
    )

    redirect_to todos_path
  end

  def update
    completed = params[:completed]
    todo = Todo.of_user(current_user).find(params[:id])
    todo.completed = completed
    todo.save!
    redirect_to todos_path
  end

  def destroy
    id = params[:id]
    todo = Todo.of_user(current_user).find(id)
    todo.destroy
    redirect_to todos_path
  end
end
