class GardenService
    def self.create_garden(data)
      response = BaseService.connection.post("/api/v1/users/#{data[:user_id]}/gardens", _json: data.to_json, content_type: 'application/json')
      BaseService.get_json(response)
    end

    def self.get_garden_info(user_id)
      response = BaseService.connection.get("/api/v1/users/#{user_id}/gardens")
      BaseService.get_json(response)
    end
end
