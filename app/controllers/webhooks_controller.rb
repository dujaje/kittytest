class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token
  @dev = ENV['DEVELOPER_TOKEN']
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
                      "text": "#{@dev} #{text}!!!"
                      }
                    }
        HTTP.post(url, json: my_reply)
      end
    end
    render plain: my_reply
  end

  def url
    "https://graph.facebook.com/v2.6/me/messages?access_token=EAAdHTu6J8uMBAAc19ijgenHlcZABGERZCLGUX6X3QzYe0ZA2C2wac0XcDv2IRXL525sLBsZARZAksKNZCQfc2ayZCib6ZAd7PTfnG5O4VJ7Xd4NRZAWX0HEhZBrTZCEHrZCzNCkdSD7mMuTT0iYdB7jrAdFOKzgW37YZCP7ZAUGV0IeJtZBvQZDZD"
  end

end
