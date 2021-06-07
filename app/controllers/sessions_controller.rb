class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      render plain: "Welcome " + user.first_name
    else
      render plain: "Invalid password!"
    end
  end
end
