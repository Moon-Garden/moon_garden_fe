require 'rails_helper'

RSpec.describe 'Welcome Index Page' do
    context "a user is not logged in" do
        it "allows the user to log in through Google" do
            Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:google_oauth2]
                visit '/'

                click 'login'
                expect(current_path).to eq('/dashboard')
        end
    end
end