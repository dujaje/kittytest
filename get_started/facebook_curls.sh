################################################################################
################################################################################
################################################################################
################################################################################


# All the useful Facebook curls.
# --> ALWAYS <-- Replace the ngrok and the access token to your own
# You should set the whitelist domain before setting the home url


################################################################################
################################################################################
################################################################################
################################################################################


# this gets all info from fb
curl -X GET "https://graph.facebook.com/v2.6/me/messenger_profile?fields=whitelisted_domains,payment_settings,target_audience,home_url,account_linking_url,greeting,persistent_menu,get_started&access_token=EAAKziwfhwZC0BACq9bkcyPMfrd249H3TNapPL8gcDyBqykPixjFZANNR3kWb2ZAdEZBiXyQyogIhsHOqDeMmKw8PyLMXiZAM2phZCczLF4YrT9CSpYcj8JM1zIzaJEA2C8pzX3SfoV5ZA317J3WOfepIZARsmSZB9ZCJ7Lg5MqPIpU9QZDZD"

# Gets all the whitelisted domain.

curl -X GET "https://graph.facebook.com/v2.6/me/messenger_profile?fields=whitelisted_domains&access_token=EAAdHTu6J8uMBAJATzQaUGcUvOuGQJ94d7nG5wXaIunLDmtdz0nZBWkd7sK8GSsrXnr9IhFDP1eRRjhVV8QCdxFIUWaWBM4wqte2FKzUSoN8tlXqAEk8Su1uIPdJ2G6DL0bYwn5mscLwxqXJegY2ZCpNhsYqxHZB4BIuOuVvAgZDZD"


# ADAPT this to whitelist domain. "add" != "remove"
curl -X POST -H "Content-Type: application/json" -d '{
  "setting_type" : "domain_whitelisting",
  "whitelisted_domains" : ["https://kittysplit.herokuapp.com"],
  "domain_action_type": "add"
}' "https://graph.facebook.com/v2.6/me/thread_settings?access_token=EAAdHTu6J8uMBAAZAO48Grid3TNHryiHu6Bi9EFYXhOhPHsw6haZA9VAli66kgrzYxmfQFfZCVFZCNZCAyL0eU4Ug5LOdYbMnZC13KpZCvZBgZC09RxC6ZCWYfNGWtNTZAPOy3uaPEhOzf9a3tUhcjZARGH86LUUbh4RmuydoQbzlZB1XpugZDZD"


# This initiates the home url for Kitty
curl -X POST -H "Content-Type: application/json" -d ' {
  "home_url" : {
     "url": "https://kittysplit.herokuapp.com/extension/welcome",
     "webview_height_ratio": "tall",
     "webview_share_button": "hide",
     "in_test":true
  }

}' "https://graph.facebook.com/v2.6/me/messenger_profile?access_token=EAAdHTu6J8uMBAAZAO48Grid3TNHryiHu6Bi9EFYXhOhPHsw6haZA9VAli66kgrzYxmfQFfZCVFZCNZCAyL0eU4Ug5LOdYbMnZC13KpZCvZBgZC09RxC6ZCWYfNGWtNTZAPOy3uaPEhOzf9a3tUhcjZARGH86LUUbh4RmuydoQbzlZB1XpugZDZD"

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

#This is for the get started page


 curl -X POST -H "Content-Type: application/json" -d '{
 "greeting":[
     {
     "locale":"default",
     "text":"Hi there, I'\''mKitty. I'\''ll help you split your expenses. First, create a Kitty in a group chat. Find me here to see all your expenses."
     }, {
     "locale":"en_US",
     "text":"Hi there, I'\''m Kitty. I'\''ll help you split your expenses. First, create a Kitty in a group chat. Find me here to see all your expenses."
     }
 ]
 }' "https://graph.facebook.com/v2.6/me/messenger_profile?access_token=EAAKziwfhwZC0BACq9bkcyPMfrd249H3TNapPL8gcDyBqykPixjFZANNR3kWb2ZAdEZBiXyQyogIhsHOqDeMmKw8PyLMXiZAM2phZCczLF4YrT9CSpYcj8JM1zIzaJEA2C8pzX3SfoV5ZA317J3WOfepIZARsmSZB9ZCJ7Lg5MqPIpU9QZDZD"
