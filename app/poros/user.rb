class User 
    attr_reader :first_name, :email, :image

    def initialize(data)
      @first_name = data[:attributes][:first_name]
      @email = data[:attributes][:email]
      @image = data[:attributes][:image]
    end
end