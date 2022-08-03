require 'rails_helper'

RSpec.describe GardenFacade do
  before do
    @user_hash =
    { 'name' => 'Jennifer Halloran',
      'email' => 'frankfurters@weinermobile.com',
      'unverified_email' => 'frankfurters@weinermobile.com',
      'email_verified' => true,
      'first_name' => 'Jennifer',
      'last_name' => 'Halloran',
      'image' => 'https://lh3.googleusercontent.com/a-/AFdZucr_zffBdhJaydFkdXeeHkhe2BzmVNKGIE-Ozwvh=s96-c' }

    @user = UserService.find_or_create_user(@user_hash)

    @garden_hash =
      {
        "user_id": "#{@user[:data][:id]}",
        "name": 'Summer Garden',
        "notes": "it's too damn hot",
        "cardinal_direction": 1
      }

    @garden = GardenFacade.create_garden(@garden_hash)

    @garden_hash_2 =
    {
      "user_id": "#{@user[:data][:id]}",
      "name": 'Winter Garden',
      "notes": "it's too damn cold",
      "cardinal_direction": 1
    }

    @garden2 = GardenFacade.create_garden(@garden_hash_2)
  end

  describe '#create_garden(data)' do
    it 'returns a garden object', :vcr do
     
      expect(@garden).to be_a(Garden)
    end
  end

  it 'returns data for a single garden', :vcr do

    garden = GardenFacade.get_garden_data(@garden_hash[:user_id], @garden.id)

    expect(garden).to be_a(Garden)
  end

  describe '#get_gardens(user_id)' do
    it 'returns the gardens associated with a user by id', :vcr do
     
      user_gardens = GardenFacade.get_gardens(@user[:data][:id])

      expect(user_gardens).to be_all(Garden)
      expect(user_gardens.count).to be >= 2
    end
  end

  describe '#destroy_garden(data)' do
    it 'destroys a users garden', :vcr do
 
      user_gardens_length1 = GardenFacade.get_gardens(@user[:data][:id]).length

      GardenFacade.destroy_garden(@user[:data][:id], @garden.id)
      GardenFacade.destroy_garden(@user[:data][:id], @garden2.id)

      user_gardens_length2 = GardenFacade.get_gardens(@user[:data][:id]).length

      expect(user_gardens_length2).to be < (user_gardens_length1)
    end
  end
end
