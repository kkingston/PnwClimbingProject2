class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    @routes = Route.order_by_user
    @reviews = Review.order_reviews_by_user
    redirect_to '/' if !@user
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :email, :location, :partner)
  end

end
