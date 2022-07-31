class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    if auth_hash['credentials']['token'].present?
      user = UserFacade.find_or_create_user(auth_hash[:info])
      set_session(user)
      require 'pry'; binding.pry
      redirect_to '/dashboard'
     end
  end

  private 

  def set_session(user)
    session[:user_id] = user.id #this is a string
    session[:email] = user.email
    session[:image] = user.image
    session[:name] = user.name
  end

end
