class FacebookUtils
  
  #class << self
    
    def oauth
      @@oauth ||= Koala::Facebook::OAuth.new(AppConfig.fb_app_id, AppConfig.fb_app_secret, "#{AppConfig.url}/main/authorized")
    end
    
    def token_from_signed_request(signed_request)
      oauth.parse_signed_request(signed_request)["oauth_token"]
    end

    def like_from_signed_request(signed_request)
      oauth.parse_signed_request(signed_request)["page"]["liked"]
    end

    def token_from_code(code)
      oauth.get_access_token(code)
    end
    
    def user_id(token)
      Koala::Facebook::GraphAPI.new(token).get_object("me")["id"]
    end

    def login_url(back_url)
      oauth.url_for_oauth_code(
          :permissions => '',
          :callback => back_url
      )
    end
 #end
  
end
