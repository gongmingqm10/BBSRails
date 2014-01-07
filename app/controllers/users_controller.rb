class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path(@user)
    else
      render 'web_ui/register'
    end
  end

  private

  def user_params
    params.permit(:username, :password, :email)
  end

end