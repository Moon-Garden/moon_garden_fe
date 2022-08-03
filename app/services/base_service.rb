class BaseService
  def self.connection
    Faraday.new(url: 'https://moon-garden-be.herokuapp.com')
  end

  def self.moon_connection
    Faraday.new(url: 'https://api.farmsense.net')
  end

  def self.plant_connection
    Faraday.new(url: 'https://openfarm.cc')
  end

  def self.get_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.geocoder_connection
    Faraday.new(url: 'http://www.mapquestapi.com')
  end

  def self.land_connection
    Faraday.new(url: 'https://native-land.ca')
  end

  def self.ip_connection
    Faraday.new(url: 'http://www.geoplugin.net')
  end

  def self.weather_connection
    Faraday.new(url: 'https://api.openweathermap.org')
  end
end
