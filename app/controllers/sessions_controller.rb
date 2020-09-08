class SessionsController < ApplicationController
  # logging in, logging out, omniauth
  def welcome
  end

  def new 
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    if @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else
      flash[:error] = "Something went wrong, please try again!"
      redirect_to login_path
    end
  end
  
  def omniauth
    # binding.pry
    user = User.create_from_omniauth(auth)
    if user.valid?
      session[:user_id] = user.id
      redirect_to welcome_path
    else
      flash[:error] = user.errors.full_messages.join(", ")
      redirect_to root_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to '/'
  end

  private
    def auth
      request.env['omniauth.auth']
    end

end