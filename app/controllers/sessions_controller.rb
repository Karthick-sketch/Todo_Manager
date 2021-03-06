class SessionsController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def create
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      session[:current_user_id] = user.id
      redirect_to todos_path
    else
      flash[:error] = "You are login attemp was invalid. Please try again"
      redirect_to new_sessions_path
    end
  end

  def destroy
    session[:current_user_id] = nil
    @current_user = nil
    redirect_to "/"
  end
end
