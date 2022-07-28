class UserFacade

  def self.create_or_find_user(data)
    json = UserService.create_or_find_user(data)
    User.new(json[:data])
  end
end
