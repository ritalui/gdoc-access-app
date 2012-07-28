require 'google/api_client'

class ProviderAuthsController < ApplicationController
  def index
    @auths = ProviderAuth.all
#    @provider_auths = current_user.provider_auths if current_user
  end

  def create
    # save the hash returned by omniauth
    auth = request.env["omniauth.auth"]

    # search for existing authentication entry with matching provider and uid
    authEntry = ProviderAuth.find_by_provider_and_uid(auth['provider'], auth['uid'])

    # if not found, create and save authentication
    if authEntry.nil?
      authEntry = ProviderAuth.new
      authEntry.provider = auth['provider'] 
      authEntry.uid = auth['uid']
      authEntry.access_token = auth['credentials']['token']
      authEntry.refresh_token = auth['credentials']['refresh_token']
      authEntry.user_id = current_user.id
      authEntry.save
    else
      # else just update the token
      authEntry.access_token = auth['credentials']['token']
      authEntry.refresh_token = auth['credentials']['refresh_token']
      authEntry.save
    end
    redirect_to provider_auths_path
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

