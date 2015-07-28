class RestaurantsController < ApplicationController
  def index
  	@restaurants = Restaurant.all.order('created_at DESC')
  end

  def show
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
  	end
end
