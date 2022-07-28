class UsersController < ApplicationController

  def create
     auth_hash = request.env['omniauth.auth']
     if auth_hash['credentials']['token'].present?
      session[:id] = auth_hash['credentials']['token']
      #  UserFacade.create_user(auth_hash[:info])
       redirect_to '/dashboard'
     end
  end

end
