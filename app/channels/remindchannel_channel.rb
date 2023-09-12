class RemindchannelChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'remindchannel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
