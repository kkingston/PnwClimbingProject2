class ReviewsController < ApplicationController

  def create
    find_route
    @review = @route.reviews.create(review_params)
    if @route.reviews.save
      redirect_to route_path(@route) 
    else
      flash[:errors] = @route.reviews.errors.full_messages
      redirect_to route_path(@route)
    end
  end

  def destroy
    find_route
    @review = @route.reviews.find_by(params[:id])
    @review.destroy
    redirect_to route_path(@route)
  end
  
  private
  def find_route
    @route = Route.find_by(params[:route_id])
  end

  def review_params
    params.require(:review).permit(:user_id, :route_id, :date, :time, :stars, :difficulty, :experience, :beta, :recommended)
  end
end
