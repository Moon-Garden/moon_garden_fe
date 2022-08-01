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
    it 'returns the top 5 results related to a search' do 
      visit '/gardens/339/'
      fill_in 
    end
  end
end