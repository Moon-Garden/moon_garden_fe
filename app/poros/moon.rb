class Moon
  attr_reader :phase, :name

  def initialize(data)
    @phase = data[:Phase]
    @name = format_moon_name(data[:Moon])
  end

  def format_moon_name(array)
    array.join(', ')
  end
end
