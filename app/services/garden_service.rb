class GardenService
    def self.create_garden(data)
      response = BaseService.connection.post("/api/v1/users/#{data[:user_id]}/gardens", _json: data.to_json, content_type: 'application/json')
      BaseService.get_json(response)
    end
end
