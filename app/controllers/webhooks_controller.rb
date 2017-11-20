class WebhooksController < ApplicationController
  def messenger
    verification_token = "mytoken"
    if params["hub.verify_token"] == verification_token
      render plain: params["hub.challenge"]
    else
      render plain: "error"
    end
  end
end
