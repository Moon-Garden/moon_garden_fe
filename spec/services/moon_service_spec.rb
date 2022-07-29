require 'rails_helper'

RSpec.describe 'moon service' do
  context 'get_moon_data' do
    it 'gives me the moon data', :vcr do

      timestamp = Time.new.to_i
          response = MoonService.get_moon_data(timestamp)
          expect(response).to be_a Array
          expect(response.first).to be_a Hash
          expect(response.first[:Phase]).to be_a String
        end
    end
end
