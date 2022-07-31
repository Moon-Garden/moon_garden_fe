class PlantTrackingFacade
  def self.create_plant(data)
    json = PlantTrackingService.create_plant(data)
    PlantTracking.new(json)
  end
end