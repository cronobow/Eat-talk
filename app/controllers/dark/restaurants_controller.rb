class Dark::RestaurantsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_admin

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = "Successfully created"
      redirect_to dark_restaurants_path
    else
      flash.now[:alert] = "Failed to Create"
      render :new
    end
  end

  def edit

  end

  def update
    if @restaurant.update(restaurant_params)
      flash[:notice] = "Successfully updated"
      redirect_to dark_restaurant_path(@restaurant)
    else
      flash.now[:alert] = "Failed to update"
      render :edit
    end
  end

  def show

  end

  def destroy
    @restaurant.destroy
    redirect_to dark_restaurants_path
    flash[:notice] = "Successfully deleted"
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :opening_hours, :tel, :address, :description)
  end

end
