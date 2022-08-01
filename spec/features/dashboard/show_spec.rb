require 'rails_helper'

RSpec.describe 'Dashboard Show Page' do
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
    end

    it 'directs a user to their dashboard upon logging in' do

      expect(current_path).to eq('/dashboard')
    end

    it "has header links to dashboard, logout, and landing page" do
      expect(page).to have_link("My Garden")
      expect(page).to have_link("Logout")
      expect(page).to have_link("About")
    end

    it "displays the users name and picture" do

      expect(page).to have_content("Dot's Gardens")
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

    it "displays the moon phase data" do
      expect(page).to have_content("Bread Moon")
      expect(page).to have_content("Plant crops with seeds inside the fruit (beans, peppers, tomatoes, squash and melons).")
    end
  end

  context 'a visitor is not logged in' do
    it "redirects the visitor to the landing page and flashes an error message" do
      @moon = JSON.parse(File.read('spec/fixtures/moon.json'),symbolize_names: true)
      allow(MoonService).to receive(:get_moon_data).and_return(@moon)
      visit '/dashboard'

      expect(current_path).to eq('/')
      expect(page).to have_content("Please log in below to view your dashboard.")
    end
  end
end
