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
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  	def restaurant_params
  		params.require(:restaurant).permit(:name, :address)
  	end
end
