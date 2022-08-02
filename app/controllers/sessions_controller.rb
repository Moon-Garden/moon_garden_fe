class SessionsController < ApplicationController
  
  def create
    auth_hash = request.env['omniauth.auth']
    if auth_hash['credentials']['token'].present?
      user = UserFacade.find_or_create_user(auth_hash[:info])
      set_session(user)
      redirect_to '/dashboard'
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def set_session(user)
    session[:user_id] = user.id
    session[:email] = user.email
    session[:image] = user.image
    session[:first_name] = user.name.split.first
    session[:last_name] = user.name.split.last
  end
end
