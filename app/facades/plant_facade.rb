class PlantFacade

  def self.search_plant_data(keyword)
    json = PlantService.search_plant_data(keyword)[:data]
    # binding.pry
    json.map do |plant_data|
      Plant.new(plant_data)
    end.first(5)

  end

  def self.get_plant_data(id)
    json = PlantService.get_plant_data(id)[:data]

    Plant.new(json)

  end
end
