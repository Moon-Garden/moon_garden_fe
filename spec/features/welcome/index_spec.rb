require 'rails_helper'

RSpec.describe 'Welcome Index Page' do
  context 'a user is logged in' do
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

    it 'has header links to users dashboard' do
      visit '/'
      click_link("My Garden")

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content("Dot's Gardens")
    end

    it "gives the user the option to logout" do
      visit '/'
      click_link("Logout")

      expect(current_path).to eq('/')
      expect(page).to have_content("Login with Google")
      expect(page).to_not have_content("My Garden")
    end

    it 'has an about section with the idea behind the app' do
      visit '/'

      within '.dash-main-bar' do
        expect(page).to have_content('About Moon Garden')
      end
    end

    it "has the moon phase data" do
      expect(page).to have_content("Bread Moon")
      expect(page).to have_content("Plant crops with seeds inside the fruit (beans, peppers, tomatoes, squash and melons).")
    end
  end

  context 'a visitor is not logged in' do
    before do
      @user = JSON.parse(File.read('spec/fixtures/user.json'), symbolize_names: true)
      @gardens = JSON.parse(File.read('spec/fixtures/gardens.json'), symbolize_names: true)
      @hotdog_garden = JSON.parse(File.read('spec/fixtures/hotdog_garden.json'), symbolize_names: true)
      @moon = JSON.parse(File.read('spec/fixtures/moon.json'),symbolize_names: true)

      allow(UserService).to receive(:find_or_create_user).and_return(@user)
      allow(GardenService).to receive(:get_gardens).and_return(@gardens)
      allow(GardenService).to receive(:get_garden_info).and_return(@hotdog_garden)
      allow(MoonService).to receive(:get_moon_data).and_return(@moon)

      visit '/'
    end

    it "has an option to sign in with google" do

      expect(page).to_not have_content("My Garden")

      click_link("Login with Google")

      expect(current_path).to eq('/dashboard')
      expect(page).to have_content("Dot's Gardens")
    end

    it 'has an about section with the idea behind the app' do
      visit '/'

      within '.dash-main-bar' do
        expect(page).to have_content('About Moon Garden')
      end
    end

    it "displays the moon phase data" do
      expect(page).to have_content("Bread Moon")
      expect(page).to have_content("Plant crops with seeds inside the fruit (beans, peppers, tomatoes, squash and melons).")
    end
  end
end
