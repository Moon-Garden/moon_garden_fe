class ApplicationController < ActionController::Base
  before_action :set_lunar_rec
  helper_method :get_weather, :ip_address

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

  def ip_address
    if Rails.env.production?
      request.remote_ip
    else
      Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
    end
  end

  def get_weather
    location = IpFacade.get_ip_location(ip_address)
    lat = location.coordinates.split(",").first
    long = location.coordinates.split(",").last
    WeatherFacade.get_weather(lat, long)
  end

  def contributors
  end
  
end
