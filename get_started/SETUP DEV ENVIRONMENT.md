Kitty. A bot to track your expenses on facebook.
- Every developer has to develop on their own app but using the same git repo so that they can test webhooks etc. Setup for this is below:

--------------------------------------------------------------------------------------------

1 - Download ngrok
ngrok creates a tunnel between your localhost and a web server so you can live test webhooks with Facebook.
Download ngrok at: https://ngrok.com/
Add the file to the root folder of kittytest
Add the following to your application.yml file:

development:
  NGROK: "<Your HTTPS ngrok server>"

production:
  NGROK: "https://kittysplit.herokuapp.com"

Start a rails server
Use command ./ngrok http 3000 to start ngrok connected to localhost 3000 (replace 3000 with whatever localhost port you use)

--------------------------------------------------------------------------------------------

2 - Create a facebook app
Go to https://developers.facebook.com/, top right menu to add an app. Names ending in itty prefered
Add app id to application.yml file as APP_ID
Add app secret to applciation.yml file as APP_SECRET
Add your name (E.g. "jamie") to applciation.yml file as DEVELOPER_TOKEN

--------------------------------------------------------------------------------------------

3 - Add messenger product to your facebook app
Add page access token to application.yml file as ACCESS_TOKEN
Attach app to a facebook page. Can use the Kitty Dev page instead of creating your own.
Setup webhook with the following events: messages, messaging_postbacks, messaging_optins. Webhook url should be your_https_ngrok_server/webhooks. Verfication token = whatever you want (we suggest "mytoken")
Add verifcation token to application.yml as messenger_verification_token:

--------------------------------------------------------------------------------------------

4 - Apply facebook curls
Go to facebook_curls.sh file
Run the curl to set a whitelist domain. The domain should be changed to your ngrok server and the access_token=your_access_token from the application.yml file. Put it in explicitly.
Run the curl to set the home url. Again, the domain should be changed to your ngrok server and the access_token=your_access_token from the application.yml file. Put it in explicitly.
Both should have ended with a success message

--------------------------------------------------------------------------------------------

5 - Message the page
Message the page you linked your app to. If it replies, all is good and you can start building.















