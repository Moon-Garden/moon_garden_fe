class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    if auth_hash['credentials']['token'].present?
      user = UserFacade.find_or_create_user(auth_hash[:info])
      # binding.pry
      session[:user_id] = user.id #this is a string
      redirect_to '/dashboard'
     end
  end
end
