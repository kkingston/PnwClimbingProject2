class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  def index
    @routes = Route.all
  end

  def new 
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)

    if @route.save
      redirect_to route_path(@route)
    else 
      flash[:errors] = @route.errors.full_messages
      render :new
    end
  end

  def show
  end

  def edit
  end   

  def update
    if @route.update(route_params)
      redirect_to @route
    else
      flash[:errors] = @route.errors.full_messages
      render :edit
    end
  end

  def destroy
    @route.destroy

    redirect_to root_path
  end

  private

  def route_params
    params.require(:route).permit(:name, :style, :grade, :stars, :pitches, :location)
  end

  def set_route
    @route = Route.find_by_id(params[:id])
  end
end
