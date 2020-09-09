class ReviewsController < ApplicationController
  before_action :set_route, only: [:create, :destory, :show, :new, :index]
  before_action :set_review, only: [:show]

  def index
    if @route = Route.find_by_id(params[:route_id])
      @reviews = @routes.reviews
    else
      @reviews = Review.all  
    end
  end

  def new
    if @review = @route.reviews.build
    else
      @review = Review.new 
    end
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to route_path(@route) 
    else
      render :new
    end
  end

  def show
   
  end

  def destroy
    @review = @route.reviews.find_by_id(params[:id])
    @review.destroy
    redirect_to reviews_path
  end
  
  private
  def set_route
    @route = Route.find_by(params[:route_id])
  end

  def set_review
    @review = Review.find_by(params[:id])
  end 

  def review_params
    params.require(:review).permit(:route_id, :date, :time, :stars, :experience, :recommended)
  end
end
