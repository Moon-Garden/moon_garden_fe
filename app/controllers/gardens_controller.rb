class GardensController < ApplicationController
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
  end
end
