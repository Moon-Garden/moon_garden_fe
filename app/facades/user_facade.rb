class UserFacade
  def self.find_or_create_user(data)
    json = UserService.find_or_create_user(data)
    User.new(json[:data])
  end
end
