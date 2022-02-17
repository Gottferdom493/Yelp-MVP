class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def delete
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to restaurants_path
  end


  def create
    @restaurant = Restaurant.new(params[:restaurant])
    @restaurant.save
    redirect_to restaurants_path(@restaurant)
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :adress, :category)
  end


end
