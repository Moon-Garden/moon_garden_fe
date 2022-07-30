class GardenFacade
    def self.create_garden(data)
        json = GardenService.create_garden(data)
        Garden.new(json[:data])
    end

end