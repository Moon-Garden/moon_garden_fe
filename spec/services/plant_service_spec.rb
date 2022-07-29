require 'rails_helper'

RSpec.describe 'plant service' do
  context 'search_plant_data' do
    it 'gives me a list of plants when I search by keyword', :vcr do
        response = PlantService.search_plant_data("basil")
        expect(response).to be_a Hash
        expect(response[:data]).to be_a Array
        # binding.pry
        expect(response[:data].first[:id]).to be_a String
        expect(response[:data].first[:attributes]).to be_a Hash
        expect(response[:data].first[:attributes][:name]).to be_a String
        expect(response[:data].first[:attributes][:sun_requirements]).to be_a String
        expect(response[:data].first[:attributes][:description]).to be_a String
        expect(response[:data].first[:attributes][:sowing_method]).to be_a String
        expect(response[:data].first[:attributes][:spread]).to be_an Integer
        expect(response[:data].first[:attributes][:row_spacing]).to be_an Integer
        expect(response[:data].first[:attributes][:height]).to be_an Integer
        expect(response[:data].first[:attributes][:main_image_path]).to be_a String

    end

    it 'gives me plant info given an ID', :vcr do
        response = PlantService.get_plant_data("543c216c3938620002020000")
        expect(response).to be_a Hash
        expect(response[:data]).to be_a Hash
        expect(response[:data][:attributes]).to be_a Hash
        expect(response[:data][:attributes][:name]).to be_a String
        expect(response[:data][:attributes][:sun_requirements]).to be_a String
        expect(response[:data][:attributes][:description]).to be_a String
        expect(response[:data][:attributes][:sowing_method]).to be_a String
        expect(response[:data][:attributes][:spread]).to be_an Integer
        expect(response[:data][:attributes][:row_spacing]).to be_an Integer
        expect(response[:data][:attributes][:height]).to be_an Integer
        expect(response[:data][:attributes][:main_image_path]).to be_a String

    end
  end
end
