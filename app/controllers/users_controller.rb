class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def index
    render "index"
  end

  def show
    user = User.find(params[:id])
    render plain: user.first_name
  end

  def create
    user = User.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )

    unless user.save
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to new_user_path
    else
      session[:current_user_id] = user.id
      redirect_to "/"
    end
  end

  def login
    user = User.where("email = ? and password = ?", params[:email], params[:password]).first
    render plain: user.present?
  end
end
