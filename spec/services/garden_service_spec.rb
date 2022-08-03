require 'rails_helper'

RSpec.describe 'garden be service' do
  before do
    @user_hash =
    { 'name' => 'Jennifer Halloran',
      'email' => 'frankfurters@weinermobile.com',
      'unverified_email' => 'frankfurters@weinermobile.com',
      'email_verified' => true,
      'first_name' => 'Jennifer',
      'last_name' => 'Halloran',
      'image' => 'https://lh3.googleusercontent.com/a-/AFdZucr_zffBdhJaydFkdXeeHkhe2BzmVNKGIE-Ozwvh=s96-c' }

    @user_response = UserService.find_or_create_user(@user_hash)

    @garden_hash =
    {
      "user_id": "#{@user_response[:data][:id]}",
      "name": 'Summer Garden',
      "notes": "it's too damn hot",
      "cardinal_direction": 1
    }

    @response = GardenService.create_garden(@garden_hash)
  end

  context 'create_garden' do
    it 'passes in garden info and creates a garden associated with a user', :vcr do


      expect(@response).to be_a Hash
      expect(@response[:data]).to be_a Hash
      expect(@response[:data]).to have_key :id
      expect(@response[:data][:attributes]).to have_key :name
      expect(@response[:data][:attributes]).to have_key :cardinal_direction
      expect(@response[:data][:attributes]).to have_key :notes
    end
  end

  it 'gets garden info', :vcr do

    response = GardenService.get_gardens("#{@user_response[:data][:id]}")

    expect(response[:data]).to be_an(Array)
    expect(response[:data].first).to have_key(:id)
    expect(response[:data].first).to have_key(:type)
    expect(response[:data].first).to have_key(:attributes)
    expect(response[:data].first[:attributes]).to have_key(:name)
    expect(response[:data].first[:attributes]).to have_key(:cardinal_direction)
    expect(response[:data].first[:attributes]).to have_key(:notes)
  end

  it 'gets a single gardens information', :vcr do

    response = GardenService.get_garden_info("#{@garden_hash[:user_id]}", @response[:data][:id])

    expect(response[:data]).to be_a(Hash)
    expect(response[:data]).to have_key(:id)
    expect(response[:data]).to have_key(:type)
    expect(response[:data]).to have_key(:attributes)
    expect(response[:data][:attributes]).to have_key(:cardinal_direction)
    expect(response[:data][:attributes]).to have_key(:name)
    expect(response[:data][:attributes]).to have_key(:notes)
  end

  context 'destroy_garden' do
    it 'destroys a users garden', :vcr do
      user_hash =
        { 'name' => 'Jennifer Halloran',
          'email' => 'frankfurters@weinermobile.com',
          'unverified_email' => 'frankfurters@weinermobile.com',
          'email_verified' => true,
          'first_name' => 'Jennifer',
          'last_name' => 'Halloran',
          'image' => 'https://lh3.googleusercontent.com/a-/AFdZucr_zffBdhJaydFkdXeeHkhe2BzmVNKGIE-Ozwvh=s96-c' }

      user = UserService.find_or_create_user(user_hash)

      garden_hash =
        {
          "user_id": "#{user[:data][:id]}",
          "name": 'Summer Garden',
          "notes": "it's too damn hot",
          "cardinal_direction": 1
        }

      garden = GardenFacade.create_garden(garden_hash)

      user_gardens_length1 = GardenFacade.get_gardens(user[:data][:id]).length

      GardenService.destroy_garden(user[:data][:id], garden.id)

      user_gardens_length2 = GardenFacade.get_gardens(user[:data][:id]).length

      expect(user_gardens_length2).to_not eq(user_gardens_length1)
    end
  end
end
