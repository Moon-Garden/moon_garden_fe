require 'rails_helper'

RSpec.describe Weather do 
  it 'exists and has attributes' do 
    data = 
    {
      "coord": {
          "lon": 104.9903,
          "lat": 39.7392
      },
      "weather": [
          {
              "id": 801,
              "main": "Clouds",
              "description": "few clouds",
              "icon": "02n"
          }
      ],
      "base": "stations",
      "main": {
          "temp": 76.37,
          "feels_like": 75.87,
          "temp_min": 76.37,
          "temp_max": 76.37,
          "pressure": 1003,
          "humidity": 46,
          "sea_level": 1003,
          "grnd_level": 859
      },
      "visibility": 10000,
      "wind": {
          "speed": 2.3,
          "deg": 345,
          "gust": 2.28
      },
      "clouds": {
          "all": 16
      },
      "dt": 1659548247,
      "sys": {
          "type": 2,
          "id": 2010097,
          "country": "CN",
          "sunrise": 1659564078,
          "sunset": 1659615059
      },
      "timezone": 28800,
      "id": 1816821,
      "name": "Bayan Hot",
      "cod": 200
    }
    denver_weather = Weather.new(data)

    expect(denver_weather).to be_an_instance_of(Weather)
    expect(denver_weather.main).to eq("Clouds") 
    expect(denver_weather.description).to eq("few clouds")
    expect(denver_weather.icon).to eq("02n")
    expect(denver_weather.temp).to eq(76.37)
  end
end