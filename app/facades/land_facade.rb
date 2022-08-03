class LandFacade
  def self.get_land_data(ll)
    json = LandService.get_land_data(ll)
    json.map { |land_data| Land.new(land_data) }
  end
end
