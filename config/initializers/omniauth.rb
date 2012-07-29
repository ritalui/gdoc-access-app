OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do

#  Follow this format to add support for different providers:
#  provider :twitter, 'CONSUMER_KEY', 'CONSUMER_SECRET'

  # According to Google (https://developers.google.com/drive/scopes),
  # tokens with scope https://docs.google.com/feeds (for Google Docs 
  # List API) are accepted and treated the same as tokens with scope 
  # https://www.googleapis.com/auth/drive (for Google Drive API)
  
  #CLIENT_ID = '884400023839-ipq00tkh959eddng96fu67h2ndscsnmf.apps.googleusercontent.com'
  #CLIENT_SECRET = '03xaPKwJ8377cdnviJz13G7V'
  #googleDocsScope = "https://www.googleapis.com/auth/userinfo.email " \
   #                 + "https://docs.google.com/feeds/ " \
    #                + "https://docs.googleusercontent.com/"

  #provider :google_oauth2, CLIENT_ID, 
   #                        CLIENT_SECRET,
    #                       :scope => googleDocsScope
    provider :google_oauth2, '884400023839-89fkhgf72lcu7gp88tnjtumu96b131km.apps.googleusercontent.com', 
    'Ip6_oRRLJeptw2wrOIhMl7km', :scope => 'https://www.googleapis.com/auth/userinfo.email https://docs.google.com/feeds/ https://docs.googleusercontent.com/ https://spreadsheets.google.com/feeds/'
end

