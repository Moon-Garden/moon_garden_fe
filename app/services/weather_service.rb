class WeatherService
  def self.get_weather(lat, long)
    response = BaseService.weather_connection.get('/data/2.5/weather?') do |f|
      f.params['appid'] = ENV['WEATHER_KEY']
      f.params['lat'] = lat
      f.params['lon'] = long
      f.params['units'] = 'imperial'
    end
    BaseService.get_json(response)
  end
end