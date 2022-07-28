class User 
    attr_reader :first_name, :email, :image, :id

    def initialize(data)
      @id = data[:id]
      @first_name = data[:attributes][:first_name]
      @email = data[:attributes][:email]
      @image = data[:attributes][:image]
    end
end