class DashboardController < ApplicationController
  def show
    # binding.pry
    @gardens = GardenFacade.get_garden_info(session[:user_id])[0..5]
  end
end
