class DashboardController < ApplicationController
  def show
    @gardens = GardenFacade.get_gardens(session[:user_id])[0..5]
    if !params[:location]
      params[:location] = 'Washington, DC'
    end
      @ll = GeocoderFacade.get_coordinates(params[:location])
  end
end
