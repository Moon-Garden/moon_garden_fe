class PlantsController < ApplicationController
  def search
    # binding.pry
    @results = PlantFacade.search_plant_data(params[:search])
  end
end