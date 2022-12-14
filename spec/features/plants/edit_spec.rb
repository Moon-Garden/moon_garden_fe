require 'rails_helper'

RSpec.describe 'plant edit page' do
  before do
    @user_hash =
      { 'name' => 'Hot Dog',
        'email' => 'frankfurters@weinermobile.com',
        'unverified_email' => 'frankfurters@weinermobile.com',
        'email_verified' => true,
        'first_name' => 'Hot',
        'last_name' => 'Dog',
        'image' => 'https://lh3.googleusercontent.com/a-/AFdZucr_zffBdhJaydFkdXeeHkhe2BzmVNKGIE-Ozwvh=s96-c' }

      @user = UserFacade.find_or_create_user(@user_hash)

      @garden_hash =
      {
        "user_id": "#{@user.id}",
        "name": 'Summer Garden',
        "notes": "it's too damn hot",
        "cardinal_direction": 1
      }

    @garden = GardenFacade.create_garden(@garden_hash)

    @plant_hash =
    {
      "user_id": "#{@user.id}",
      "garden_id": "#{@garden.id}",
      "name": "Carrot",
      "plant_id": "sae2340987dage",
      "moon_phase": "waxing crescent",
      "date_planted": Date.new,
      "date_matured": Date.new,
      "bounty_amount": 23,
      "pruning_behaviors": "No pruning, only thinning",
      "notes": "Magic carrots matured on the same day they were planted!"
    }

    @plant = PlantTrackingFacade.create_plant(@plant_hash)
  end

  context 'happy path' do
    it 'has a button to edit a plant in a garden', :vcr do

      visit '/'
      click_on 'Login'

      visit "/gardens/#{@garden.id}"

      expect(page).to have_content("Carrot")
      expect(page).to have_content("Magic carrots matured on the same day they were planted!")
      within ".plant-#{@plant.id}" do
        click_button 'Add Tracking Info'
      end
      
      expect(current_path).to eq("/gardens/#{@garden.id}/plants/#{@plant.id}/edit")
      
      fill_in "notes", with: "Keep calm and carrot on ya'll"
      click_button "Update Plant"

      expect(current_path).to eq("/gardens/#{@garden.id}")
      expect(page).to have_content("Keep calm and carrot on ya'll")
      expect(page).to_not have_content("Magic carrots matured on the same day they were planted!")
      
      PlantTrackingFacade.destroy_plant(@user.id, @garden.id, @plant.id)
      GardenFacade.destroy_garden(@user.id, @garden.id)
     end
  end

  context 'a visitor is not logged in', :vcr do
    it "redirects a visitor to the dashboard" do     
      visit "/gardens/#{@garden.id}/plants/#{@plant.id}/edit"
      expect(current_path).to eq('/')
      expect(page).to have_content("Oopsy daisy! Please log in below to view that page.")
    end
  end
end
