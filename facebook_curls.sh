# Facebook curls

# this gets all info from fb
curl -X GET "https://graph.facebook.com/v2.6/me/messenger_profile?fields=whitelisted_domains,payment_settings,target_audience,home_url,account_linking_url,greeting,persistent_menu,get_started&access_token=EAAB8DxnfIC0BAM4vUNAq4bhadiG9NQPp5yIL3MkXZAFZAOdOP5y0JaKVlCAw8s4DeYAZAKpVP0GzAQKMUcIOQtEd4ZAGKiiLMoJKas1uS9TCYJRYMvzGd7WvY9NbxaOOIMy2tw2EXp5K3p1ZCfoglJxuWresnAUHlvOUbwBvtLwZDZD"

# Gets all the whitelisted domain.......... then remove
curl -X GET "https://graph.facebook.com/v2.6/me/messenger_profile?fields=whitelisted_domains&access_token=EAAKziwfhwZC0BAH4J6aLp6jUVIN6aBsQu6fuhVNJ2h5hewA20y9ZA0cGh6oLKuymKT24a50HgO2wl2rQw9lqrKZBNSavN8gYHqZC73wot44O2QIiWZAqS9ePDWZBOfZCKEpR01jEIyTa3qn38Ns81KA8nZBRQlwukyIUqd3S0TFufQZDZD"

# This whitelists a domain
curl -X POST -H "Content-Type: application/json" -d '{
  "whitelisted_domains":[
    "https://a573e282.ngrok.io/extension/*"
  ]
}' "https://graph.facebook.com/v2.6/me/messenger_profile?access_token=EAAKziwfhwZC0BALOQcGfsiinlFcoFzf7CQQoBd5C33MKNe4exC7bUvjpFZBzDtPuZCHacfJE5J9FUOqesmEsa1g2FAKAiJbg6Ttb3GVZBVCQwUc7fFh0zBc1rLld63Cjs7i7Sl48QHEeTu3k4XDEagVpj3HJkLdOO8KW21Wi1AZDZD"

# ADAPT this to whitelist domain. "add" != "remove"
curl -X POST -H "Content-Type: application/json" -d '{
  "setting_type" : "domain_whitelisting",
  "whitelisted_domains" : ["https://a573e282.ngrok.io"],
  "domain_action_type": "add"
}' "https://graph.facebook.com/v2.6/me/thread_settings?access_token=EAAKziwfhwZC0BAH4J6aLp6jUVIN6aBsQu6fuhVNJ2h5hewA20y9ZA0cGh6oLKuymKT24a50HgO2wl2rQw9lqrKZBNSavN8gYHqZC73wot44O2QIiWZAqS9ePDWZBOfZCKEpR01jEIyTa3qn38Ns81KA8nZBRQlwukyIUqd3S0TFufQZDZD"


# This initiates the home url for Kitty
curl -X POST -H "Content-Type: application/json" -d ' {
  "home_url" : {
     "url": "https://a573e282.ngrok.io/extension/welcome",
     "webview_height_ratio": "tall",
     "webview_share_button": "hide",
     "in_test":true
  }

}' "https://graph.facebook.com/v2.6/me/messenger_profile?access_token=EAAKziwfhwZC0BALOQcGfsiinlFcoFzf7CQQoBd5C33MKNe4exC7bUvjpFZBzDtPuZCHacfJE5J9FUOqesmEsa1g2FAKAiJbg6Ttb3GVZBVCQwUc7fFh0zBc1rLld63Cjs7i7Sl48QHEeTu3k4XDEagVpj3HJkLdOO8KW21Wi1AZDZD"



# This initiates the home url for a test of Kitty
curl -X POST -H "Content-Type: application/json" -d ' {
  "home_url" : {
     "url": "<YOUR NGROK>/extension/welcome",
     "webview_height_ratio": "tall",
     "webview_share_button": "hide",
     "in_test":true
  }
}' "https://graph.facebook.com/v2.6/me/messenger_profile?access_token=<YOUR TEST ACCESS TOKEN>"



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
