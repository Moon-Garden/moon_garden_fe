class UsersController < ApplicationController

  def show
     auth_hash = request.env['omniauth.auth']
     if auth_hash['credentials']['token'].present?
       # UserFacade.find_or_create_by(email: auth_hash['info']['email'])
       UserFacade.find_or_create_by(auth_hash)
       redirect_to '/dashboard'
     end
     binding.pry
  end

end
