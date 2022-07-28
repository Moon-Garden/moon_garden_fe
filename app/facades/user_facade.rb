class UserFacade

  def self.create_user(data)
    json = UserService.create_user(data)
    User.new(json[:data])
  end
end
