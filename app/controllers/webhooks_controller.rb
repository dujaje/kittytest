require_relative '../views/botreply'

class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def messenger
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
        if messaging["read"]
          # do nothing
        else
          sender = messaging["sender"]["id"]
          text = messaging["message"]["text"]
          my_reply = reply(sender)

          HTTP.post(url, json: my_reply)
        end
      end
      render plain: my_reply
    end
  end

  def url
    "https://graph.facebook.com/v2.6/me/messages?access_token=#{ENV['ACCESS_TOKEN']}"
  end
end
