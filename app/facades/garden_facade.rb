class GardenFacade
  def self.create_garden(data)
    json = GardenService.create_garden(data)
    Garden.new(json[:data])
  end

  def self.get_gardens(user_id)
    json = GardenService.get_gardens(user_id)[:data]
    json.map do |garden_data|
      Garden.new(garden_data)
    end
  end

  def self.get_garden_data(user_id, garden_id)
    json = GardenService.get_garden_info(user_id, garden_id)
    Garden.new(json[:data])
  end

  def self.destroy_garden(user_id, garden_id)
    GardenService.destroy_garden(user_id, garden_id)
  end
end
