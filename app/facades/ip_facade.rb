class IpFacade
  def self.get_ip_location(ip)
    json = IpService.get_ip_location(ip)
    lat = json[:geoplugin_latitude].to_s
    lng = json[:geoplugin_longitude].to_s
    Geocoder.new(lat, lng)
  end
end
