class WeatherFacade
  def self.get_weather(lat, long)
    json = WeatherService.get_weather(lat, long)
    Weather.new(json)
  end
end