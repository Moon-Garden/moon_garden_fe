class PlantsController < ApplicationController
  def search
    @results = PlantFacade.search_plant_data(params[:name])
  end
end