class DashboardController < ApplicationController
  def show
    if session[:user_id]
      @gardens = GardenFacade.get_gardens(session[:user_id])[0..5]
    else  
      flash[:alert] = 'Please log in below to view your dashboard.'
      redirect_to '/'
    end
    if !params[:location]
      params[:location] = 'Washington, DC'
    end
      @ll = GeocoderFacade.get_coordinates(params[:location])
  end
end
