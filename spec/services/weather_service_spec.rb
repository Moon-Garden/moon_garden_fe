require 'rails_helper'

RSpec.describe WeatherService do 
  it 'returns the weather based on lat long', :vcr do 
    lat = '39.7392'
    long = '104.9903'

    response = WeatherService.get_weather(lat, long)

    expect(response).to be_a(Hash)
    expect(response).to have_key(:coord)
    expect(response).to have_key(:weather)
    expect(response[:weather][0]).to have_key(:main)
    expect(response[:weather][0]).to have_key(:main)
    expect(response[:weather][0]).to have_key(:icon)
    expect(response).to have_key(:main)
    expect(response[:main]).to have_key(:temp)  
  end
end