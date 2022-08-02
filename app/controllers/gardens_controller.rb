class GardensController < ApplicationController
  before_action :authorize_user
  
  def new; end

  def create
    garden_info = params.permit(:name, :notes, :cardinal_direction)
    garden_info[:user_id] = session[:user_id].to_i
    GardenFacade.create_garden(garden_info)
    flash[:alert] = 'Garden Created'
    redirect_to dashboard_path
  end

  def show
    @garden = GardenFacade.get_garden_data(session[:user_id], params[:id])
    @plants = PlantTrackingFacade.get_plants(session[:user_id], params[:id])[0..10]
  end
end
