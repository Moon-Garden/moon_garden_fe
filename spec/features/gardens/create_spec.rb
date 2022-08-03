require 'rails_helper'

RSpec.describe 'garden create' do
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
  end

  context 'a user is logged in' do
    before do 
      visit '/'
      click_on 'Login'
     end 

    it 'can add a new garden', :vcr do
      expect(page).to_not have_content("Magical Garden")

      click_button "Add New Garden"

      expect(current_path).to eq("/gardens/new")
      
      fill_in "name", with: "Magical Garden"
      fill_in "notes", with: "Pretty plants to poison our enemies."
      select "North"
      click_button "Save"

      expect(current_path).to eq("/dashboard")
      expect(page).to have_content("Garden Created")
      
      GardenFacade.destroy_garden(@user.id, @garden.id)
    end
  end 

  context 'a visitor is not logged in' do
    it "redirects a visitor to the dashboard", :vcr do     
      visit '/gardens/new'
      expect(current_path).to eq('/')
      expect(page).to have_content("Oopsy daisy! Please log in below to view that page.")
    end
  end
end 
