class FacebookService
  include HTTParty
  base_uri 'https://graph.facebook.com'

  def initialize
    @options = {
      query: {
        fields: "first_name,last_name,profile_pic,locale,timezone,gender",
        access_token: ENV['ACCESS_TOKEN']
      },
      headers: { 'Content-Type': 'application/json' }
    }
  end

  def get_profile(user)
    self.class.get("/v2.6/#{user.psid}", @options)
  end
end
