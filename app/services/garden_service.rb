class GardenService
    def self.create_garden(data)
      response = BaseService.connection.post("/api/v1/users/gardens", _json: data.to_json, content_type: 'application/json')
      # binding.pry
      BaseService.get_json(response)
    end
end
