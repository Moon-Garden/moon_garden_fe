class MoonService
    def self.get_moon_data(timestamp)
        response = BaseService.moon_connection.get("/v1/moonphases/?d=#{timestamp}", content_type: 'application/json')
        BaseService.get_json(response)
    end
end
