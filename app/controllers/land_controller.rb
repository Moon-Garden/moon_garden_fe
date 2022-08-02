class LandController < ApplicationController
  def show
    if Rails.env.production?
      @ip = request.remote_ip
    else
      @ip = Net::HTTP.get(URI.parse('http://checkip.amazonaws.com/')).squish
    end
    if !params[:location]
      @ll = IpFacade.get_ip_location(@ip)
    else
      @ll = GeocoderFacade.get_coordinates(params[:location])
    end
  end
end