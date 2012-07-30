require 'google/api_client'

class ProviderAuthsController < ApplicationController
  def index
    @auths = ProviderAuth.all
#    @provider_auths = current_user.provider_auths if current_user
  end

  def create
    @user_id = current_user.id
    # save the hash returned by omniauth
    auth = request.env["omniauth.auth"]
    @provider_auth = ProviderAuth.create_authEntry(auth, current_user.id)
    redirect_to user_tasks_url
  end

  def destroy
    @provider_auth = current_user.provider_auths.find(params[:id])
    @provider_auth.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to provider_auths_path
  end

  def failure
    render :text => request.env["omniauth.auth"].to_yaml rescue "Provider failed to authenticate"
  end
  
end

