class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def messenger
    # p params
    if params["hub.verify_token"] == ENV['messenger_verification_token']
      render plain: params["hub.challenge"]
    else
      render plain: "error"
    end
  end

  def receive_message
    therequest = request.body.read
    data = JSON.parse(therequest)
    entries = data["entry"]
    sender = nil
    text = nil
    my_reply = nil
    entries.each do |entry|
      entry["messaging"].each do |messaging|
        sender = messaging["sender"]["id"]
        text = messaging["message"]["text"]
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
                                        "title": "Welcome to Kitty",
                                          "subtitle": "The best app for money sharing",
                                          "image_url": "https://scontent-lhr3-1.xx.fbcdn.net/v/t1.0-9/23658371_154645468621882_4383150760338193341_n.png?oh=f21774eb176fef440d61a6a20c577ba7&oe=5A9BF90F",
                                          "buttons": [{
                                            "type": "web_url",
                                            "url": "https://kittymoneysplitter.herokuapp.com/extension/welcome",
                                            "title": "Open Kitty"
                                          }, {
                                            "type": "postback",
                                            "title": "Meow",
                                            "payload": "Payload for first element in a generic bubble",
                                          }],
                                        }]
                                      }
                                    }
                      }
                    }
        HTTP.post(url, json: my_reply)
      end
      render plain: my_reply
    end
  end

  def url
    "https://graph.facebook.com/v2.6/me/messages?access_token=EAAdHTu6J8uMBAAc19ijgenHlcZABGERZCLGUX6X3QzYe0ZA2C2wac0XcDv2IRXL525sLBsZARZAksKNZCQfc2ayZCib6ZAd7PTfnG5O4VJ7Xd4NRZAWX0HEhZBrTZCEHrZCzNCkdSD7mMuTT0iYdB7jrAdFOKzgW37YZCP7ZAUGV0IeJtZBvQZDZD"
  end

end
