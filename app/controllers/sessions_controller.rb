class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    # binding.pry
     if auth_hash['credentials']['token'].present?
      session[:id] = auth_hash['info']['email']
       user = UserFacade.find_or_create_user(auth_hash[:info])
       require 'pry'; binding.pry
       redirect_to '/dashboard'
     end
  end
end