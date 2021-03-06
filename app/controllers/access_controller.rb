class AccessController < ApplicationController

  layout 'admin'


  before_action :confirm_logged_in, except: [:login, :attempt_login, :logout]

  def menu
    @user_name = session[:user_name]
  end

  def login
  end

  def attempt_login
    if params[:user_name].present? && params[:password].present?
      found_user = AdminUser.where(user_name: params[:user_name]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end

    if authorized_user
      session[:user_id] = authorized_user.id
      session[:user_name] = authorized_user.user_name
      flash[:notice] = "You are now logged in"
      puts "Logged in *********"
      redirect_to(admin_path)
    else
      flash.now[:notice] = 'invalid username/password combination.'
      render('login')
    end
  end

  def logout
    session[:user_id] = nil
    session[:user_name] = nil
    flash[:notice] = "logged out"
    redirect_to(access_login_path)
  end
end
