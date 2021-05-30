class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: User.order(:id).map { |user| user.to_pleasant_string }.join("\n")
  end

  def show
    user = User.find(params[:id])
    render plain: user.to_pleasant_string
  end

  def create
    name = params[:name]
    email = params[:email]
    password = params[:password]

    new_user = User.create!(name: name, email: email, password: password)
    render plain: "Hey, a new user is created with the id #{new_user.id}"
  end

  def update
    completed = params[:completed]
    user = User.find(params[:id])
    user.completed = completed
    user.save!
    render plain: "Upload user completed status to #{completed}"
  end

  def login
    user = User.where("email = ? and password = ?", params[:email], params[:password])
    render plain: user.all.size != 0
  end
end
