require 'rails_helper'

RSpec.describe WeatherService do 
  it 'returns the weather based on lat long', :vcr do 
    lat = '39.7392'
    long = '104.9903'

    response = WeatherService.get_weather(lat, long)

    expect(response).to be_a(Hash)
  end
end