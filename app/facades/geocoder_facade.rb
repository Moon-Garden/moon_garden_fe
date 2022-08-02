class GeocoderFacade
  def self.get_coordinates(location)
    json = GeocoderService.get_coordinates(location)
    lat = json[:results].first[:locations].first[:latLng][:lat].to_s
    lng = json[:results].first[:locations].first[:latLng][:lng].to_s
    Geocoder.new(lat, lng)
  end
end
