class DashboardController < ApplicationController
  def show
    # binding.pry
    @gardens = GardenFacade.get_gardens(session[:user_id])[0..5]
  end
end
