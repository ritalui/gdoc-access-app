class ApplicationController < ActionController::Base
  protect_from_forgery
  # make it a helper method, so it can be accessed in the view
  helper_method :current_user, :build_client, :client, :drive
  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

 def build_client
   authEntry = ProviderAuth.where("user_id = ?", current_user.id).first
   client = Google::APIClient.new
   client.authorization.client_id = authEntry.access_token #saving token in client_id to maintain uniqueness
   client.authorization.scope = "https://docs.google.com/feeds/"
   client.authorization.access_token = authEntry.access_token
   client
 end
 
 def client
   build_client
 end
 
 def drive
   drive = client.discovered_api('drive', 'v2')
 end
 
end
