# Facebook curls

# This whitelists a domain
curl -X POST -H "Content-Type: application/json" -d '{
  "whitelisted_domains":[
    "https://f5aa87a1.ngrok.io/extension/*"
  ]
}' "https://graph.facebook.com/v2.6/me/messenger_profile?access_token=EAAdHTu6J8uMBAAc19ijgenHlcZABGERZCLGUX6X3QzYe0ZA2C2wac0XcDv2IRXL525sLBsZARZAksKNZCQfc2ayZCib6ZAd7PTfnG5O4VJ7Xd4NRZAWX0HEhZBrTZCEHrZCzNCkdSD7mMuTT0iYdB7jrAdFOKzgW37YZCP7ZAUGV0IeJtZBvQZDZD"

# ADAPT this to whitelist domain. "add" != "remove"
curl -X POST -H "Content-Type: application/json" -d '{
  "setting_type" : "domain_whitelisting",
  "whitelisted_domains" : ["https://9569869d.ngrok.io"],
  "domain_action_type": "add"
}' "https://graph.facebook.com/v2.6/me/thread_settings?access_token=EAAdHTu6J8uMBAAc19ijgenHlcZABGERZCLGUX6X3QzYe0ZA2C2wac0XcDv2IRXL525sLBsZARZAksKNZCQfc2ayZCib6ZAd7PTfnG5O4VJ7Xd4NRZAWX0HEhZBrTZCEHrZCzNCkdSD7mMuTT0iYdB7jrAdFOKzgW37YZCP7ZAUGV0IeJtZBvQZDZD"


# This initiates the home url
curl -X POST -H "Content-Type: application/json" -d ' {
  "home_url" : {
     "url": "http://9569869d.ngrok.io",
     "webview_height_ratio": "tall",
     "webview_share_button": "hide",
     "in_test":true
  }
}' "https://graph.facebook.com/v2.6/me/messenger_profile?access_token=EAAdHTu6J8uMBAAc19ijgenHlcZABGERZCLGUX6X3QzYe0ZA2C2wac0XcDv2IRXL525sLBsZARZAksKNZCQfc2ayZCib6ZAd7PTfnG5O4VJ7Xd4NRZAWX0HEhZBrTZCEHrZCzNCkdSD7mMuTT0iYdB7jrAdFOKzgW37YZCP7ZAUGV0IeJtZBvQZDZD"




{
      "attachment": {
        "type": "template",
        "payload": {
        "template_type": "generic",
          "elements": [{
          "title": "First card",
            "subtitle": "Element #1 of an hscroll",
            "image_url": "http://messengerdemo.parseapp.com/img/rift.png",
            "buttons": [{
              "type": "web_url",
              "url": "https://www.messenger.com",
              "title": "web url"
            }, {
              "type": "postback",
              "title": "Postback",
              "payload": "Payload for first element in a generic bubble",
            }],
          }, {
            "title": "Second card",
            "subtitle": "Element #2 of an hscroll",
            "image_url": "http://messengerdemo.parseapp.com/img/gearvr.png",
            "buttons": [{
              "type": "postback",
              "title": "Postback",
              "payload": "Payload for second element in a generic bubble",
            }],
          }]
        }
      }
    }