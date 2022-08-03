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
      @weather = JSON.parse(File.read('spec/fixtures/weather.json'), symbolize_names: true)
      @ip = JSON.parse(File.read('spec/fixtures/ip.json'), symbolize_names: true)


      allow(UserService).to receive(:find_or_create_user).and_return(@user)
      allow(GardenService).to receive(:get_gardens).and_return(@gardens)
      allow(PlantTrackingService).to receive(:get_plants).and_return(@plants)
      allow(GardenService).to receive(:get_garden_info).and_return(@hotdog_garden)
      allow(MoonService).to receive(:get_moon_data).and_return(@moon)
      allow(WeatherService).to receive(:get_weather).and_return(@weather)
      allow(IpService).to receive(:get_ip_location).and_return(@ip)
      allow_any_instance_of(ApplicationController).to receive(:ip_address).and_return("24.164.247.195")

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

  context 'a user is logged in and theres a full moon' do
    before do
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]


      @user = JSON.parse(File.read('spec/fixtures/user.json'), symbolize_names: true)
      @gardens = JSON.parse(File.read('spec/fixtures/gardens.json'), symbolize_names: true)
      @plants = JSON.parse(File.read('spec/fixtures/plants.json'), symbolize_names: true)
      @hotdog_garden = JSON.parse(File.read('spec/fixtures/hotdog_garden.json'), symbolize_names: true)
      @full_moon = JSON.parse(File.read('spec/fixtures/full_moon.json'), symbolize_names: true)

      allow(UserService).to receive(:find_or_create_user).and_return(@user)
      allow(GardenService).to receive(:get_gardens).and_return(@gardens)
      allow(PlantTrackingService).to receive(:get_plants).and_return(@plants)
      allow(GardenService).to receive(:get_garden_info).and_return(@hotdog_garden)
      allow(MoonService).to receive(:get_moon_data).and_return(@full_moon)

      visit '/'
      click_on 'Login'
    end
     it "displays full moon data" do
      expect(page).to have_content("Blood Moon")
      expect(page).to have_content("Root vegetables, such as carrots, beets, onions and potatoes, will flourish. It's also a good time to transplant seedlings or to prune.")
    end
  end

  context 'a user is logged in and theres a waning moon' do
    before do
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]


      @user = JSON.parse(File.read('spec/fixtures/user.json'), symbolize_names: true)
      @gardens = JSON.parse(File.read('spec/fixtures/gardens.json'), symbolize_names: true)
      @plants = JSON.parse(File.read('spec/fixtures/plants.json'), symbolize_names: true)
      @hotdog_garden = JSON.parse(File.read('spec/fixtures/hotdog_garden.json'), symbolize_names: true)
      @waning_moon = JSON.parse(File.read('spec/fixtures/waning_moon.json'), symbolize_names: true)

      allow(UserService).to receive(:find_or_create_user).and_return(@user)
      allow(GardenService).to receive(:get_gardens).and_return(@gardens)
      allow(PlantTrackingService).to receive(:get_plants).and_return(@plants)
      allow(GardenService).to receive(:get_garden_info).and_return(@hotdog_garden)
      allow(MoonService).to receive(:get_moon_data).and_return(@waning_moon)

      visit '/'
      click_on 'Login'
    end
     it "displays full moon data" do
      expect(page).to have_content("Big Ol' Wane")
      expect(page).to have_content( 'Avoid planting and focus on fertilizing the soil. This is the best time to mow grass, harvest, transplant and prune.')
    end
  end

    context 'a user is logged in and theres an error with the moon' do
    before do
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]


      @user = JSON.parse(File.read('spec/fixtures/user.json'), symbolize_names: true)
      @gardens = JSON.parse(File.read('spec/fixtures/gardens.json'), symbolize_names: true)
      @plants = JSON.parse(File.read('spec/fixtures/plants.json'), symbolize_names: true)
      @hotdog_garden = JSON.parse(File.read('spec/fixtures/hotdog_garden.json'), symbolize_names: true)
      @error_moon = JSON.parse(File.read('spec/fixtures/error_moon.json'), symbolize_names: true)

      allow(UserService).to receive(:find_or_create_user).and_return(@user)
      allow(GardenService).to receive(:get_gardens).and_return(@gardens)
      allow(PlantTrackingService).to receive(:get_plants).and_return(@plants)
      allow(GardenService).to receive(:get_garden_info).and_return(@hotdog_garden)
      allow(MoonService).to receive(:get_moon_data).and_return(@error_moon)

      visit '/'
      click_on 'Login'
    end
     it "displays error moon data" do
      expect(page).to have_content("Interesting, this is a moon we don't have anything for! We will work on that!")
    end
  end

  context 'a user is logged in and theres an dark moon' do
    before do
      Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]


      @user = JSON.parse(File.read('spec/fixtures/user.json'), symbolize_names: true)
      @gardens = JSON.parse(File.read('spec/fixtures/gardens.json'), symbolize_names: true)
      @plants = JSON.parse(File.read('spec/fixtures/plants.json'), symbolize_names: true)
      @hotdog_garden = JSON.parse(File.read('spec/fixtures/hotdog_garden.json'), symbolize_names: true)
      @dark_moon = JSON.parse(File.read('spec/fixtures/dark_moon.json'), symbolize_names: true)

      allow(UserService).to receive(:find_or_create_user).and_return(@user)
      allow(GardenService).to receive(:get_gardens).and_return(@gardens)
      allow(PlantTrackingService).to receive(:get_plants).and_return(@plants)
      allow(GardenService).to receive(:get_garden_info).and_return(@hotdog_garden)
      allow(MoonService).to receive(:get_moon_data).and_return(@dark_moon)

      visit '/'
      click_on 'Login'
    end
     it "displays error moon data" do
      expect(page).to have_content("Real Spooky")
      expect(page).to have_content( 'Plant crops which produce seeds outside the fruit (grains, spinach, cauliflower, cabbage, broccoli, celery and lettuce).')
    end
  end


  context 'a visitor is not logged in' do
    it "redirects the visitor to the landing page and flashes an error message" do
      @moon = JSON.parse(File.read('spec/fixtures/moon.json'),symbolize_names: true)
      allow(MoonService).to receive(:get_moon_data).and_return(@moon)
      visit '/dashboard'

      expect(current_path).to eq('/')
      expect(page).to have_content("Oopsy daisy! Please log in below to view that page.")
    end
  end
end
