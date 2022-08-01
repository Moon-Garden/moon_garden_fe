class GeocoderService
  def self.get_latlng(location)
    response = BaseService.geocoder_connection
    .get("/geocoding/v1/address/?key=#{ENV['MAPQUEST_KEY']}&location=#{location}", content_type: 'application/json')
    BaseService.get_json(response)
  end
end