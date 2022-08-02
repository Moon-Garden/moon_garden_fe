class LandService
  def self.get_land_data(lat, lng)
    response = BaseService.land_connection
    .get("wp-json/nativeland/v1/api/index.php?maps=languages&position=#{lat},#{lng}", content_type: 'application/json')
    BaseService.get_json(response)
  end
end