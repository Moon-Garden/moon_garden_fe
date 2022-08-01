require 'rails_helper'

RSpec.describe 'plant search page' do 
  context 'happy path' do
    before do
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

      @user = JSON.parse(File.read('spec/fixtures/user.json'), symbolize_names: true)
      @gardens = JSON.parse(File.read('spec/fixtures/gardens.json'), symbolize_names: true)
      @hotdog_garden = JSON.parse(File.read('spec/fixtures/hotdog_garden.json'), symbolize_names: true)
      @moon = JSON.parse(File.read('spec/fixtures/moon.json'),symbolize_names: true)

      allow(UserService).to receive(:find_or_create_user).and_return(@user)
      allow(GardenService).to receive(:get_gardens).and_return(@gardens)
      allow(GardenService).to receive(:get_garden_info).and_return(@hotdog_garden)
      allow(MoonService).to receive(:get_moon_data).and_return(@moon)

      visit '/'
      click_on 'Login'
    end
    it 'returns the top 5 results related to a search', :vcr do 
      visit '/gardens/339/'

      fill_in :search, with: 'corn'
      click_on 'Find Plants to add to Garden'

      expect(current_path).to eq("/gardens/339/plants")
      expect(page).to have_content('Name: corn')
      expect(page).to have_content('Sun Requirements: Full Sun')
      expect(page).to have_content('Sowing Method: Direct seed outdoors')
      expect(page).to have_content('Row Spacing: 76')
      expect(page).to have_content('Description: Corn is a large grain plant, or tall grass, first domesticated about 10,000 years ago by indigenous peoples in Southern Mexico. The leafy stalk produces ears after pollination. Depending on the variety, the corn can be eaten fresh, or dried and ground into cornmeal.')
      expect(page).to_not have_content('basil')
    end 
  end
end