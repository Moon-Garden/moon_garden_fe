#remove this comment
class LandController < ApplicationController
  def show
    if !params[:location]
      @ll = IpFacade.get_ip_location(ip_address)
    else
      @ll = GeocoderFacade.get_coordinates(params[:location])
    end
    @lands = LandFacade.get_land_data(@ll.coordinates) 
  end
end