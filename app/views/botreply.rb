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
                                    "image_url": "https://scontent-lhr3-1.xx.fbcdn.net/v/t1.0-9/23658371_154645468621882_4383150760338193341_n.png?oh=f21774eb176fef440d61a6a20c577ba7&oe=5A9BF90F",
                                    "buttons": [{
                                      "type": "web_url",
                                      "url": "https://41c2d0ff.ngrok.io/extension/welcome",
                                      "title": "Open Kitty",
                                      "messenger_extensions": true
                                    }, {
                                      "type": "postback",
                                      "title": "#{ENV['DEVELOPER_TOKEN']}: Meow",
                                      "payload": "lalalalala",
                                    }],
                                  }]
                                }
                              }
                }
              }
  return my_reply
end
