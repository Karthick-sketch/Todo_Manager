class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in

  def new
    render "users/new"
  end

  def create
    email = params[:email]
    unless User.is_the_email_exist?(email)
      user = User.new(
        first_name: params[:first_name],
        last_name: params[:last_name],
        email: email,
        password: params[:password],
      )

      unless user.save
        flash[:error] = user.errors.full_messages.join(", ")
        redirect_to new_user_path
      else
        session[:current_user_id] = user.id
        redirect_to "/"
      end
    else
      flash[:error] = "This email is already taken by an user"
      redirect_to new_user_path
    end
  end
end
