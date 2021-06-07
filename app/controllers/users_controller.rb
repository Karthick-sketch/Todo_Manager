class UsersController < ApplicationController
  def new
    render "users/new"
  end

  def index
    render "index"
  end

  def show
    user = User.find(params[:id])
    render plain: user.to_pleasant_string
  end

  def create
    User.create!(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      password: params[:password],
    )
    redirect_to "/"
  end

  def login
    user = User.where("email = ? and password = ?", params[:email], params[:password]).first
    render plain: user.present?
  end
end
