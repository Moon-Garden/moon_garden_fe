class User
  attr_reader :name, :email, :image, :id

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @email = data[:attributes][:email]
    @image = data[:attributes][:image]
  end
end
