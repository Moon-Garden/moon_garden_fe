class GardensController < ApplicationController
  def new
  end
  
  def create
    require 'pry'; binding.pry
    # GardenFacade.create_garden
  end
end