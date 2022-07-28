class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    # binding.pry
     if auth_hash['credentials']['token'].present?
      session[:id] = auth_hash['info']['email']
      #  UserFacade.create_or_find_user(auth_hash[:info])
       redirect_to '/dashboard'
     end
  end
end