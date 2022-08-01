class Moon
  attr_reader :phase, :name, :illumination

  def initialize(data)
    @phase = data[:Phase]
    @name = format_moon_name(data[:Moon])
    @illumination = (data[:Illumination] * 100).to_i
  end

  def format_moon_name(array)
    array.join(', ')
  end
end
