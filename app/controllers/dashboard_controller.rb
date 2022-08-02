class DashboardController < ApplicationController
  before_action :authorize_user

  def show
    @gardens = GardenFacade.get_gardens(session[:user_id])[0..5]
  end

end
