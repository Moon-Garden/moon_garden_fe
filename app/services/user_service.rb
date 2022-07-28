class UserService 
    def self.create_user(data)
        response = BaseService.connection.post("/api/v1/users", data.to_json, content_type: 'application/json')
        BaseService.get_json(response)
    end
end