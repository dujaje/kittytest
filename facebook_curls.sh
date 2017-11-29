# Facebook curls

# this gets all info from fb
curl -X GET "https://graph.facebook.com/v2.6/me/messenger_profile?fields=whitelisted_domains,payment_settings,target_audience,home_url,account_linking_url,greeting,persistent_menu,get_started&access_token=EAAB8DxnfIC0BAM4vUNAq4bhadiG9NQPp5yIL3MkXZAFZAOdOP5y0JaKVlCAw8s4DeYAZAKpVP0GzAQKMUcIOQtEd4ZAGKiiLMoJKas1uS9TCYJRYMvzGd7WvY9NbxaOOIMy2tw2EXp5K3p1ZCfoglJxuWresnAUHlvOUbwBvtLwZDZD"

# Gets all the whitelisted domain.......... then remove
curl -X GET "https://graph.facebook.com/v2.6/me/messenger_profile?fields=whitelisted_domains&access_token=EAAKziwfhwZC0BACq9bkcyPMfrd249H3TNapPL8gcDyBqykPixjFZANNR3kWb2ZAdEZBiXyQyogIhsHOqDeMmKw8PyLMXiZAM2phZCczLF4YrT9CSpYcj8JM1zIzaJEA2C8pzX3SfoV5ZA317J3WOfepIZARsmSZB9ZCJ7Lg5MqPIpU9QZDZD"

# This whitelists a domain
curl -X POST -H "Content-Type: application/json" -d '{
  "whitelisted_domains":[
    "https://a573e282.ngrok.io/extension/*"
  ]
}' "https://graph.facebook.com/v2.6/me/messenger_profile?access_token=EAAKziwfhwZC0BACq9bkcyPMfrd249H3TNapPL8gcDyBqykPixjFZANNR3kWb2ZAdEZBiXyQyogIhsHOqDeMmKw8PyLMXiZAM2phZCczLF4YrT9CSpYcj8JM1zIzaJEA2C8pzX3SfoV5ZA317J3WOfepIZARsmSZB9ZCJ7Lg5MqPIpU9QZDZD"

# ADAPT this to whitelist domain. "add" != "remove"
curl -X POST -H "Content-Type: application/json" -d '{
  "setting_type" : "domain_whitelisting",
  "whitelisted_domains" : ["https://a91dbaef.ngrok.io"],
  "domain_action_type": "add"
}' "https://graph.facebook.com/v2.6/me/thread_settings?access_token=EAAKziwfhwZC0BACq9bkcyPMfrd249H3TNapPL8gcDyBqykPixjFZANNR3kWb2ZAdEZBiXyQyogIhsHOqDeMmKw8PyLMXiZAM2phZCczLF4YrT9CSpYcj8JM1zIzaJEA2C8pzX3SfoV5ZA317J3WOfepIZARsmSZB9ZCJ7Lg5MqPIpU9QZDZD"


# This initiates the home url for Kitty
curl -X POST -H "Content-Type: application/json" -d ' {
  "home_url" : {
     "url": "https://a91dbaef.ngrok.io/extension/welcome",
     "webview_height_ratio": "tall",
     "webview_share_button": "hide",
     "in_test":true
  }

}' "https://graph.facebook.com/v2.6/me/messenger_profile?access_token=EAAKziwfhwZC0BACq9bkcyPMfrd249H3TNapPL8gcDyBqykPixjFZANNR3kWb2ZAdEZBiXyQyogIhsHOqDeMmKw8PyLMXiZAM2phZCczLF4YrT9CSpYcj8JM1zIzaJEA2C8pzX3SfoV5ZA317J3WOfepIZARsmSZB9ZCJ7Lg5MqPIpU9QZDZD"



# This initiates the home url for a test of Kitty
curl -X POST -H "Content-Type: application/json" -d ' {
  "home_url" : {
     "url": "https://cc2a797f.ngrok.io/extension/welcome",
     "webview_height_ratio": "tall",
     "webview_share_button": "hide",
     "in_test":true
  }
}' "https://graph.facebook.com/v2.6/me/messenger_profile?access_token=EAAKziwfhwZC0BACq9bkcyPMfrd249H3TNapPL8gcDyBqykPixjFZANNR3kWb2ZAdEZBiXyQyogIhsHOqDeMmKw8PyLMXiZAM2phZCczLF4YrT9CSpYcj8JM1zIzaJEA2C8pzX3SfoV5ZA317J3WOfepIZARsmSZB9ZCJ7Lg5MqPIpU9QZDZD"

# this initaites the greeting



  curl -X POST -H "Content-Type: application/json" -d '{
    "greeting": "[
    {
      "locale":"default",
      "text":"Hi there! My name is Kitty and I will help you split your expenses. To start, you can create a kitty in your group chats. Find me here when you want to look at all your expenses."
    }]",
  }' "https://graph.facebook.com/v2.6/me/messenger_profile?access_token=EAAKziwfhwZC0BACq9bkcyPMfrd249H3TNapPL8gcDyBqykPixjFZANNR3kWb2ZAdEZBiXyQyogIhsHOqDeMmKw8PyLMXiZAM2phZCczLF4YrT9CSpYcj8JM1zIzaJEA2C8pzX3SfoV5ZA317J3WOfepIZARsmSZB9ZCJ7Lg5MqPIpU9QZDZD"







# This is the get started payload

curl -X POST -H "Content-Type: application/json" -d '{
  "get_started":{
    "payload":"We are Kitty!"
  }
}' "https://graph.facebook.com/v2.6/me/messenger_profile?access_token=EAAKziwfhwZC0BACq9bkcyPMfrd249H3TNapPL8gcDyBqykPixjFZANNR3kWb2ZAdEZBiXyQyogIhsHOqDeMmKw8PyLMXiZAM2phZCczLF4YrT9CSpYcj8JM1zIzaJEA2C8pzX3SfoV5ZA317J3WOfepIZARsmSZB9ZCJ7Lg5MqPIpU9QZDZD"
 My name is Kitty and I will help you split your expenses. To start, you can create a kitty in your group chats. Find me here when you want to look at all your expenses."


 curl -X POST -H "Content-Type: application/json" -d '{
 "greeting":[
     {
     "locale":"default",
     "text":"Hi there, I AM Kitty. I will help you split your expenses. First, create a Kitty in a group chat. Find me here to see all your expenses."
     }, {
     "locale":"en_US",
     "text":'Hi there, I&#145;m Kitty. I will help you split your expenses. First, create a Kitty in a group chat. Find me here to see all your expenses.'
     }
 ]
 }' "https://graph.facebook.com/v2.6/me/messenger_profile?access_token=EAAKziwfhwZC0BACq9bkcyPMfrd249H3TNapPL8gcDyBqykPixjFZANNR3kWb2ZAdEZBiXyQyogIhsHOqDeMmKw8PyLMXiZAM2phZCczLF4YrT9CSpYcj8JM1zIzaJEA2C8pzX3SfoV5ZA317J3WOfepIZARsmSZB9ZCJ7Lg5MqPIpU9QZDZD"
