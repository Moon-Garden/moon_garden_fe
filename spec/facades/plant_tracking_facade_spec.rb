require 'rails_helper'

RSpec.describe PlantTrackingFacade do 
  it 'returns a plant object', :vcr do
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

    garden_response = GardenService.create_garden(garden_hash)

    plant_hash =
     {
      "user_id": "#{user_response[:data][:id]}",
      "garden_id": "#{garden_response[:data][:id]}",
      "name": "Carrot", 
      "plant_id": "sae2340987dage",
      "moon_phase": "waxing crescent",
      "date_planted": Date.new,
      "date_matured": Date.new,
      "bounty_amount": 23,
      "pruning_behaviors": "No pruning, only thinning",
      "notes": "Magic carrots matured on the same day they were planted!" 
     }

    plant = PlantTrackingFacade.create_plant(plant_hash)

    expect(plant).to be_an_instance_of(PlantTracking)
  end 

  it 'displays the users saved plant information for a specific garden', :vcr do 
    user_hash =
      { 
        'name' => 'Jennifer Halloran',
        'email' => 'jenniferlhalloran@gmail.com',
        'unverified_email' => 'jenniferlhalloran@gmail.com',
        'email_verified' => true,
        'first_name' => 'Jennifer',
        'last_name' => 'Halloran',
        'image' => 'https://lh3.googleusercontent.com/a-/AFdZucr_zffBdhJaydFkdXeeHkhe2BzmVNKGIE-Ozwvh=s96-c' 
      }

    user_response = UserService.find_or_create_user(user_hash)

    garden_hash =
      {
        "user_id": "#{user_response[:data][:id]}",
        "name": 'Summer Garden',
        "notes": "it's too damn hot",
        "cardinal_direction": 1
      }

    garden_response = GardenService.create_garden(garden_hash)

    plant_hash =
     {
      "user_id": "#{user_response[:data][:id]}",
      "garden_id": "#{garden_response[:data][:id]}",
      "name": "Carrot", 
      "plant_id": "sae2340987dage",
      "moon_phase": "waxing crescent",
      "date_planted": Date.new,
      "date_matured": Date.new,
      "bounty_amount": 23,
      "pruning_behaviors": "No pruning, only thinning",
      "notes": "Magic carrots matured on the same day they were planted!" 
     }

    response = PlantTrackingFacade.get_plants("#{user_response[:data][:id]}", "#{garden_response[:data][:id]}")

    expect(response).to be_all(PlantTracking)
  end 
end