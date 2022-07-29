class PlantService
    def self.search_plant_data(keyword)
        response = BaseService.plant_connection.get("/api/v1/crops/?filter=<#{keyword}>?token=#{ENV['PLANT_TOKEN']}", content_type: 'application/json')
        BaseService.get_json(response)
    end

    def self.get_plant_data(id)
        response = BaseService.plant_connection.get("/api/v1/crops/#{id}?token=#{ENV['PLANT_TOKEN']}", content_type: 'application/json')
        BaseService.get_json(response)
    end
end
