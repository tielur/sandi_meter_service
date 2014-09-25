class SessionsController < ApplicationController

  def create
    user = User.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || User.create_with_omniauth(auth_hash)
    session[:user_id] = user.id
    session[:access_token] = auth_hash['credentials']['token']
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    session[:access_token] = nil
    redirect_to root_url, :notice => "Signed out!"
  end


  private

  def auth_hash
    request.env['omniauth.auth']
  end
end