class DashboardController < ApplicationController
  def show
    if session[:user_id]
      @gardens = GardenFacade.get_gardens(session[:user_id])[0..5]
    else  
      flash[:alert] = 'Please log in below to view your dashboard.'
      redirect_to '/'
    end
  end
end
