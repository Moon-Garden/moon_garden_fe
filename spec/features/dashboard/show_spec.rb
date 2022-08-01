require 'rails_helper'

RSpec.describe 'Dashboard Show Page' do
  context 'a user is logged in' do
    before do
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

      @user = JSON.parse(File.read('spec/fixtures/user.json'), symbolize_names: true)
      @gardens = JSON.parse(File.read('spec/fixtures/gardens.json'), symbolize_names: true)
      @hotdog_garden = JSON.parse(File.read('spec/fixtures/hotdog_garden.json'), symbolize_names: true)

      allow(UserService).to receive(:find_or_create_user).and_return(@user)
      allow(GardenService).to receive(:get_gardens).and_return(@gardens)
      allow(GardenService).to receive(:get_garden_info).and_return(@hotdog_garden)

      visit '/'
      click_on 'Login'
    end

    it 'directs a user to their dashboard upon logging in' do

      expect(current_path).to eq('/dashboard')
    end

    it "displays the users name and picture" do

      expect(page).to have_content("Dot's Gardens")
    end
    
    it "has a section to provide lunar recommendations" do

      within '.recommendation-container' do 
        expect(page).to have_content("Lunar Recommendation")
      end 
    end

    it "displays each user garden with garden info and a link to the garden's show page" do

      expect(page).to have_link("Hot Dog Garden")
      expect(page).to have_content("Cardinal Direction: North")
      expect(page).to have_content("Notes: definitely gmo")

      expect(page).to have_link("Mustard Garden")
      expect(page).to have_content("Cardinal Direction: South")
      expect(page).to have_content("Spicy, Honey and English!")

      click_link("Hot Dog Garden")
      expect(current_path).to eq('/gardens/339')
    end

    it 'has a button to add a garden' do
      click_button("Add New Garden")
      expect(current_path).to eq("/gardens/new")
    end
  end

  context 'a visitor is not logged in' do
    it "redirects the visitor to the landing page and flashes an error message" do
      visit '/dashboard'

      expect(current_path).to eq('/')
      expect(page).to have_content("Please log in below to view your dashboard.")
    end
  end
end
