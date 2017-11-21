class WebhooksController < ApplicationController
  def messenger
    verification_token = "mytoken"
    if params["hub.verify_token"] == verification_token
      render plain: params["hub.challenge"]
    else
      render plain: "error"
    end
  end

  def receive_message
    therequest = request.body.read
    data = JSON.parse(therequest)
    entries = data["entry"]
    entries.each do |entry|
      entry["messaging"].each do |messaging|
        sender = messaging["sender"]["id"]
        text = messaging["message"]["text"]
      end
    end
  end
end
