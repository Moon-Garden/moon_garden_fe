class PlantTrackingFacade
  def self.create_plant(data)
    json = PlantTrackingService.create_plant(data)
    PlantTracking.new(json)
  end

  def self.get_plants(user_id, garden_id)
    json = PlantTrackingService.get_plants(user_id, garden_id)[:data]
    json.map do |plant_data|
      PlantTracking.new(plant_data[:attributes])
    end
  end
end