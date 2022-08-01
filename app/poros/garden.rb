class Garden
  attr_reader :name, :cardinal_direction, :notes, :id

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @cardinal_direction = data[:attributes][:cardinal_direction]
    @notes = data[:attributes][:notes]
  end
end
