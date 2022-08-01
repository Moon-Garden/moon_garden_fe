class GardensController < ApplicationController
  def new
  end
  
  def create
    require 'pry'; binding.pry
    # GardenFacade.create_garden
  end

  def show
    @garden = GardenFacade.get_garden_data(session[:user_id], params[:id])
    @plants = 
  end
end