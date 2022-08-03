class ApplicationController < ActionController::Base
  before_action :set_lunar_rec, :weather_data

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

  def weather_data
    if Rails.env.production?
      ip = request.remote_ip
    else
      ip = Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
    end
    binding.pry
    ll = IpFacade.get_ip_location(ip)
    lat =
    long = 
    @weather = WeatherFacade.get_weather(lat, long)
  end
end
