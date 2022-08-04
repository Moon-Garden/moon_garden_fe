require 'rails_helper'

RSpec.describe 'plant search page' do
  context 'happy path' do
    it 'has a button to delete a plant from a garden', :vcr do
      user_hash =
        { 'name' => 'Hot Dog',
          'email' => 'frankfurters@weinermobile.com',
          'unverified_email' => 'frankfurters@weinermobile.com',
          'email_verified' => true,
          'first_name' => 'Hot',
          'last_name' => 'Dog',
          'image' => 'https://lh3.googleusercontent.com/a-/AFdZucr_zffBdhJaydFkdXeeHkhe2BzmVNKGIE-Ozwvh=s96-c' }

      user = UserFacade.find_or_create_user(user_hash)

      garden_hash =
        {
          "user_id": "#{user.id}",
          "name": 'Summer Garden',
          "notes": "it's too damn hot",
          "cardinal_direction": 1
        }

      garden = GardenFacade.create_garden(garden_hash)

      plant_hash =
        {
          "user_id": "#{user.id}",
          "garden_id": "#{garden.id}",
          "name": 'Carrot',
          "plant_id": 'sae2340987dage',
          "moon_phase": 'waxing crescent',
          "date_planted": Date.new,
          "date_matured": Date.new,
          "bounty_amount": 23,
          "pruning_behaviors": 'No pruning, only thinning',
          "notes": 'Magic carrots matured on the same day they were planted!'
        }

      plant = PlantTrackingFacade.create_plant(plant_hash)

      visit '/'
      click_on 'Login'

      visit "/gardens/#{garden.id}"

      expect(page).to have_content('Carrot')

      within "##{plant.id}" do
        click_button 'Remove Plant'
      end
      within "#deleteModal#{plant.id}" do
        click_button 'Remove Plant'
      end

      expect(current_path).to eq("/gardens/#{garden.id}")
      expect(page).to_not have_content('Carrot')
      GardenFacade.destroy_garden(user.id, garden.id)
    end
  end
end
