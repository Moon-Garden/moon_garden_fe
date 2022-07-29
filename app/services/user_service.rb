class UserService 
    def self.find_or_create_user(data)
        response = BaseService.connection.post("/api/v1/find_or_create_user", _json: data.to_json, content_type: 'application/json')
        BaseService.get_json(response)
    end
end