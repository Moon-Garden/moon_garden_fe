class PlantTrackingFacade
  def self.create_plant(data)
    json = PlantTrackingService.create_plant(data)
    # binding.pry
    PlantTracking.new(json[:data])
  end

  def self.get_plants(user_id, garden_id)
    json = PlantTrackingService.get_plants(user_id, garden_id)[:data]
    # binding.pry
    json.map do |plant_data|
      # binding.pry
      PlantTracking.new(plant_data)
    end
  end

  def self.destroy_plant(user_id, garden_id, plant_id)
    PlantTrackingService.destroy_plant(user_id, garden_id, plant_id)
  end

  def self.edit_plant(user_id, garden_id, plant_id, attributes)
    json = PlantTrackingService.edit_plant(user_id, garden_id, plant_id, attributes)
    PlantTracking.new(json[:data])
  end
end
