# This is a comment
require 'rails_helper'

RSpec.describe 'geocoder service' do
  context 'get_coordinates' do
    it 'returns latitude and longitude', :vcr do
      location = 'Washington,DC'
      response = GeocoderService.get_coordinates(location)
      expect(response).to be_a Hash
      expect(response[:results]).to be_an Array
      expect(response[:results].first[:locations].first[:latLng][:lat])
      .to eq(38.892062)
      expect(response[:results].first[:locations].first[:latLng][:lng])
      .to eq(-77.019912)
    end
  end
end
