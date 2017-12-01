def reply(sender)
  my_reply = {
                "messaging_type": "RESPONSE",
                "recipient": {
                  "id": "#{sender}"
                },
                "message": {
                "attachment": {
                                "type": "template",
                                "payload": {
                                "template_type": "generic",
                                  "elements": [{
                                    "title": "Hello Kitty",
                                    "subtitle": "The best app for money sharing",
                                    "image_url": "https://scontent-lhr3-1.xx.fbcdn.net/v/t1.0-9/24293918_160361861383576_6874016573394267944_n.png?oh=90e1db160eb8e58d77aba118de11967e&oe=5A93E6C4",
                                    "buttons": [{
                                      "type": "web_url",
                                      "url": "#{ENV['NGROK']}/extension/welcome",
                                      "title": "Open Kitty",
                                      "messenger_extensions": true
                                    }],
                                  }]
                                }
                              }
                }
              }
  return my_reply
end

def get_started_reply(sender)
  my_reply = {
                "messaging_type": "RESPONSE",
                "recipient": {
                  "id": "#{sender}"
                },
                "message": {
                  "text": "Hi there, I'm kitty. Type anything below and I'll give you a link where you can see all your Kitties"
                }
              }
  return my_reply
end

def help_reply(sender)
  puts "in here"
  my_reply = {
                "messaging_type": "RESPONSE",
                "recipient": {
                  "id": "#{sender}"
                },
                "message": {
                  "text": "Hi there, I'm kitty. I'll help you share your expenses. Type anything below and I'll give you a link where you can see all your Kitties"
                }
              }
  return my_reply
end
