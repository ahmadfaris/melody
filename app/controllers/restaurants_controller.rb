class RestaurantsController < ApplicationController
  def index
  	@restaurants = Restaurant.all
    @restaurant = Restaurant.new
    @food = Food.new

  	respond_to do |format|
      format.html { render 'index' }
      format.json { render json: @restaurants}
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @hash = Gmaps4rails.build_markers(@restaurant) do |restaurant, marker|
      marker.lat restaurant.latitude
      marker.lng restaurant.longitude
      marker.infowindow restaurant.address
      marker.picture({
       "url" => "http://www.hoyer-group.com/fileadmin/templates/hoyer_group/skeleton/img/gmaps-marker.png",
       "width" =>  32,
       "height" => 32})
      marker.json({ name: restaurant.name })
    end
  end

  def new
    # @restaurant = Restaurant.new
    @restaurant = current_user.restaurants.build
  end

  def create
    # @restaurant = Restaurant.new(restaurant_params)
    
    @restaurant = current_user.restaurants.build(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant, notice: "Successfully created new restaurant"
    else
      render 'new'
    end

  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update(restaurant_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to root_path, notice: "Successfully deleted restaurant"
  end

  private
  	def restaurant_params
  		params.require(:restaurant).permit(:name, :address, :category, :latitude, :longitude, :image, foods_attributes: [:id, :image, :name, :price, :_destroy], drinks_attributes: [:id, :image, :name, :price, :_destroy])
  	end

    def find_restaurant
      @restaurant = Restaurant.find(params[:id])
    end
end
