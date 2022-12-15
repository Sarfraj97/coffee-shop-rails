class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(phone_number)
    client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
    client.messages.create(
      body: 'Your order is completed please receive it from shop',
      from: ENV['PHONE_NUMBER'],
      to: phone_number
    )
  end
end
