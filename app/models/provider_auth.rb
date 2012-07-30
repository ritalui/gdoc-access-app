class ProviderAuth < ActiveRecord::Base
  belongs_to :user
  
  def self.create_authEntry(auth, id)
    
    # if not found, create and save authentication
    # search for existing authentication entry with matching provider and uid
    authEntry = ProviderAuth.find_by_provider_and_uid(auth['provider'], auth['uid'])
    
    if authEntry.nil?
    authEntry = ProviderAuth.new
    authEntry.provider = auth['provider'] 
    authEntry.uid = auth['uid']
    authEntry.access_token = auth['credentials']['token']
    authEntry.refresh_token = auth['credentials']['refresh_token']
    authEntry.user_id = id
    authEntry.save
    else
      # else just update the token
      authEntry.access_token = auth['credentials']['token']
      authEntry.refresh_token = auth['credentials']['refresh_token']
      authEntry.save
    end
  end
  
end
