require 'rails_helper'

RSpec.describe 'garden show page' do
  context 'a user is logged in' do
    before do
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]

      @user = JSON.parse(File.read('spec/fixtures/user.json'), symbolize_names: true)
      @gardens = JSON.parse(File.read('spec/fixtures/gardens.json'), symbolize_names: true)
      @plants = JSON.parse(File.read('spec/fixtures/plants.json'), symbolize_names: true)
      @hotdog_garden = JSON.parse(File.read('spec/fixtures/hotdog_garden.json'), symbolize_names: true)
      @moon = JSON.parse(File.read('spec/fixtures/moon.json'),symbolize_names: true)

      allow(UserService).to receive(:find_or_create_user).and_return(@user)
      allow(GardenService).to receive(:get_gardens).and_return(@gardens)
      allow(PlantTrackingService).to receive(:get_plants).and_return(@plants)
      allow(GardenService).to receive(:get_garden_info).and_return(@hotdog_garden)
      allow(MoonService).to receive(:get_moon_data).and_return(@moon)

      visit '/'
      click_on 'Login'
      click_on "Hot Dog Garden"
    end

    it "has header links to dashboard, logout, and landing page" do

      expect(page).to have_link("My Garden")
      expect(page).to have_link("Logout")
      expect(page).to have_link("About")
    end


    xit "displays the moon phase data" do
      expect(page).to have_content("Bread Moon")
      expect(page).to have_content("Plant crops with seeds inside the fruit (beans, peppers, tomatoes, squash and melons).")
    end

    it "displays the corresponding garden's name" do

      expect(current_path).to eq("/gardens/339")
      expect(page).to have_content("Hot Dog Garden")
      expect(page).to_not have_content("Mustard Garden")
    end

    xit "displays the garden's information" do
      expect(page).to have_content("North")
      expect(page).to have_content("definitely gmo")
    end
  end
end
