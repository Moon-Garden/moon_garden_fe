class PlantsController < ApplicationController
  def search
    # binding.pry
    @garden_id = params[:id]
    @results = PlantFacade.search_plant_data(params[:search])
  end

  def create
    data = {
      "user_id": session[:user_id],
      "garden_id": params[:id],
      "name": params[:plant_name],
      "plant_id": params[:plant_api_id]
    }

    # binding.pry
    PlantTrackingFacade.create_plant(data)
    redirect_to "/gardens/#{params[:id]}"
  end
end
