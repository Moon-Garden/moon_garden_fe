require 'rails_helper'

RSpec.describe 'garden be service' do
  context 'create_garden' do
    it 'passes in garden info and creates a garden associated with a user', :vcr do
      user_hash =
        { 'name' => 'Jennifer Halloran',
          'email' => 'jenniferlhalloran@gmail.com',
          'unverified_email' => 'jenniferlhalloran@gmail.com',
          'email_verified' => true,
          'first_name' => 'Jennifer',
          'last_name' => 'Halloran',
          'image' => 'https://lh3.googleusercontent.com/a-/AFdZucr_zffBdhJaydFkdXeeHkhe2BzmVNKGIE-Ozwvh=s96-c' }
      user_response = UserService.find_or_create_user(user_hash)

      garden_hash =
        {
          "user_id": "#{user_response[:data][:id]}",
          "name": 'Summer Garden',
          "notes": "it's too damn hot",
          "cardinal_direction": 1
        }
      # headers = { 'CONTENT_TYPE' => 'application/json' }

      response = GardenService.create_garden(garden_hash)

      expect(response).to be_a Hash
      expect(response[:data]).to be_a Hash
      expect(response[:data]).to have_key :id
      expect(response[:data][:attributes]).to have_key :name
      expect(response[:data][:attributes]).to have_key :cardinal_direction
      expect(response[:data][:attributes]).to have_key :notes
    end
  end

  it 'gets garden info', :vcr do
    user_hash =
      { 'name' => 'Jennifer Halloran',
        'email' => 'jenniferlhalloran@gmail.com',
        'unverified_email' => 'jenniferlhalloran@gmail.com',
        'email_verified' => true,
        'first_name' => 'Jennifer',
        'last_name' => 'Halloran',
        'image' => 'https://lh3.googleusercontent.com/a-/AFdZucr_zffBdhJaydFkdXeeHkhe2BzmVNKGIE-Ozwvh=s96-c' }
    user_response = UserService.find_or_create_user(user_hash)

    garden_hash =
      {
        "user_id": "#{user_response[:data][:id]}",
        "name": 'Summer Garden',
        "notes": "it's too damn hot",
        "cardinal_direction": 1
      }

    response = GardenService.get_gardens("#{user_response[:data][:id]}")
    # binding.pry
    expect(response[:data]).to be_an(Array)
    expect(response[:data].first).to have_key(:id)
    expect(response[:data].first).to have_key(:type)
    expect(response[:data].first).to have_key(:attributes)
    expect(response[:data].first[:attributes]).to have_key(:name)
    expect(response[:data].first[:attributes]).to have_key(:cardinal_direction)
    expect(response[:data].first[:attributes]).to have_key(:notes)
  end
end
