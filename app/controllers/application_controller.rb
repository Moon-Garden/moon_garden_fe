class ApplicationController < ActionController::Base
  before_action :set_lunar_rec

  def authorize_user 
    unless session[:user_id]
      flash[:alert] = 'Oopsy daisy! Please log in below to view that page.'
      redirect_to '/'
    end
  end

  def set_lunar_rec
    @moon_data = MoonFacade.get_moon_data(Time.new.to_i)
    @recommendation = MoonHelper.rec(@moon_data.phase)
  end
end
