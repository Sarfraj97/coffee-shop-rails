Steps for setup front end
  npm i
  npm start
  front end will start at port number 4300.

Steps for setup back end
  rails db:create
  rails db:migrate
  rails db:seed
  rails s
  back end will start at port number 3000.

I have added following features.

1. User can add item with quantity in invoice.

2. Order will create with selected items and total price including tax and free items.

3. When user paid for the given order after a specific time SMS will be sent to user's phone number.

4. I have used twilio for SMS service so you can get twilio ACCOUNT_SID and AUTH_TOKEN by create a trial account.