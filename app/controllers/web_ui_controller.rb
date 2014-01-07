class WebUiController < ApplicationController

  before_action :login?, except: [:login, :sessions, :layout]
  def login?
    json = cookies[:user].blank? ? {} : JSON.parse(cookies[:user])
    if json['username'].blank? || json['username'] != session[:username]
      redirect_to login_path
    end
  end

  def index
    redirect_to action: :home, status: :found
  end

  def login
    render 'login', layout: nil
  end

  def register
    render 'register', layout: nil
  end

  def logout
    session.delete(:user_id)
    cookies.delete(:user)
    redirect_to login_path
  end

  def sessions
    user = User.authenticate(params[:username], params[:password])
    if user
      session[:username] = user.username
      cookies[:user] = user_info(user)
      if user.role == 'admin'
        redirect_to admin_path
      else
        redirect_to root_path
      end
    else
      @error = true
      render 'login', layout: nil
    end
  end


  def home
    render 'home', layout:nil
  end

  def admin

  end

  private

  def user_info(user)
    {
        username: user.username,
        email: user.email,
        role: user.role
    }.to_json
  end

end