# this gets all info from fb
curl -X GET "https://graph.facebook.com/v2.6/me/messenger_profile?fields=whitelisted_domains,payment_settings,target_audience,home_url,account_linking_url,greeting,persistent_menu,get_started&access_token=EAAdHTu6J8uMBAAc19ijgenHlcZABGERZCLGUX6X3QzYe0ZA2C2wac0XcDv2IRXL525sLBsZARZAksKNZCQfc2ayZCib6ZAd7PTfnG5O4VJ7Xd4NRZAWX0HEhZBrTZCEHrZCzNCkdSD7mMuTT0iYdB7jrAdFOKzgW37YZCP7ZAUGV0IeJtZBvQZDZD"

# Updates get started
curl -X POST -H "Content-Type: application/json" -d '{
  "get_started": {
    "payload":{
      "title": "Aloha"
    }
  }
}' "https://graph.facebook.com/v2.6/me/messenger_profile?access_token=EAAdHTu6J8uMBAAc19ijgenHlcZABGERZCLGUX6X3QzYe0ZA2C2wac0XcDv2IRXL525sLBsZARZAksKNZCQfc2ayZCib6ZAd7PTfnG5O4VJ7Xd4NRZAWX0HEhZBrTZCEHrZCzNCkdSD7mMuTT0iYdB7jrAdFOKzgW37YZCP7ZAUGV0IeJtZBvQZDZD"


curl -X GET "https://graph.facebook.com/v2.6/1799649990119492?fields=first_name,last_name,profile_pic&access_token=EAAdHTu6J8uMBAAc19ijgenHlcZABGERZCLGUX6X3QzYe0ZA2C2wac0XcDv2IRXL525sLBsZARZAksKNZCQfc2ayZCib6ZAd7PTfnG5O4VJ7Xd4NRZAWX0HEhZBrTZCEHrZCzNCkdSD7mMuTT0iYdB7jrAdFOKzgW37YZCP7ZAUGV0IeJtZBvQZDZD"
