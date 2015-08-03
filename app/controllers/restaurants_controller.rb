class RestaurantsController < ApplicationController
  def index
  	@restaurants = Restaurant.all

  	respond_to do |format|
      format.html { render 'index' }
      format.json { render json: @restaurants}
    end
  end

  def show
  	@restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant, notice: "Successfully created new restaurant"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to root_path, notice: "Successfully deleted restaurant"
  end

  private
  	def restaurant_params
  		params.require(:restaurant).permit(:name, :address, :category, :lat, :lng, :image)
  	end
end
