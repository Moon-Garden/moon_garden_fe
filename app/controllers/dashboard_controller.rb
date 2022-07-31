class DashboardController < ApplicationController
  def show
    if current_user
      @gardens = GardenFacade.get_garden_info(session[:user_id])[0..5]
    else
      redirect_to '/'
    end
  end
end
