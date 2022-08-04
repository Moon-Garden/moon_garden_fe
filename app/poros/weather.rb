class Weather
  attr_reader :main, 
              :description,
              :icon,
              :temp

  def initialize(data)
    @main = data[:weather][0][:main]
    @description = data[:weather][0][:description]
    @icon = data[:weather][0][:icon]
    @temp = data[:main][:temp]
  end
end