class GardenService
    def self.create_garden(data)
      # binding.pry
      response = BaseService.connection.post("/api/v1/users/#{data[:user_id]}/gardens", _json: data.to_json, content_type: 'application/json')
      # binding.pry
      BaseService.get_json(response)
    end
end
