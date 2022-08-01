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
end
