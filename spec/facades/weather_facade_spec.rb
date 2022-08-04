require 'rails_helper'

RSpec.describe WeatherFacade do 
  it 'returns weather objects from weather service', :vcr do
    lat = '39.7392'
    long = '104.9903'

    weather = WeatherFacade.get_weather(lat, long)

    expect(weather).to be_an_instance_of(Weather)
  end
end