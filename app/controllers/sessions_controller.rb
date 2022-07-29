class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    if auth_hash['credentials']['token'].present?
      user = UserFacade.find_or_create_user(auth_hash[:info])
      session[:id] = user.id
      redirect_to '/dashboard'
     end
  end
end