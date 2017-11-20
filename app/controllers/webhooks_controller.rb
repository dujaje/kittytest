class WebhooksController < ApplicationController
  def messenger
   if params[‘hub.verify_token’] == “mytoken”
     puts "success"
     render text: params[‘hub.challenge’] and return
   else
     render text: ‘error’ and return
     puts "error"
   end
  end
end
