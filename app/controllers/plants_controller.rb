class PlantsController < ApplicationController
  def search
    # binding.pry
    @garden_id = params[:id]
    @results = PlantFacade.search_plant_data(params[:search])
  end

  def new

  end

  def create
    
  end
end