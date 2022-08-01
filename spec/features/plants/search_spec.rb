require 'rails_helper'

RSpec.describe 'plant search page' do 
  context 'happy path' do
    before do
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

      @user = JSON.parse(File.read('spec/fixtures/user.json'), symbolize_names: true)
      @gardens = JSON.parse(File.read('spec/fixtures/gardens.json'), symbolize_names: true)
      @hotdog_garden = JSON.parse(File.read('spec/fixtures/hotdog_garden.json'), symbolize_names: true)
      @moon = JSON.parse(File.read('spec/fixtures/moon.json'),symbolize_names: true)
      @results = JSON.parse(File.read('spec/fixtures/tomato_search.json'), symbolize_names: true)

      allow(UserService).to receive(:find_or_create_user).and_return(@user)
      allow(GardenService).to receive(:get_gardens).and_return(@gardens)
      allow(GardenService).to receive(:get_garden_info).and_return(@hotdog_garden)
      allow(MoonService).to receive(:get_moon_data).and_return(@moon)
      allow(PlantService).to receive(:search_plant_data).and_return(@results)

      visit '/'
      click_on 'Login'
    end
    it 'returns the top 5 results related to a search', :vcr do 
      visit '/gardens/339/'

      fill_in :search, with: 'corn'
      click_on 'Find Plants to add to Garden'

      expect(current_path).to eq("/gardens/339/plants")
      expect(page).to have_content('Name: Tiny Tim Tomato')
      expect(page).to have_content('Sun Requirements: Full Sun')
      expect(page).to have_content('Sowing Method: Direct seed indoors, transplant seedlings outside after hardening off')
      expect(page).to have_content('Row Spacing: 45')
      expect(page).to have_content('Description: The tomato is the fruit of the tomato plant, a member of the Nightshade family (Solanaceae). The fruit grows on a small compact bush.')
      expect(page).to_not have_content('corn')
    end 
  end
end