class Land
  attr_reader :name, :description

  def initialize(data)
    @name = data[:properties][:Name]
    @description = data[:properties][:description]
  end
end