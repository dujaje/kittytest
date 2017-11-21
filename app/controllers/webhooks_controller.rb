class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def messenger
    p params
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
                      "text": "meow #{text}!!!"
                      }
                    }
        HTTP.post(url, json: my_reply)
      end
    end
    render plain: my_reply
  end

  def url
    "https://graph.facebook.com/v2.6/me/messages?access_token=#{ENV[ACCESS_TOKEN]}"
  end

end
