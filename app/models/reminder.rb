class Reminder < ApplicationRecord
  extend Enumerize
  enumerize :status, in: { alert: 0, success: 1, warning: 2 }, predicates: true
  belongs_to :remindable, polymorphic: true
  after_create :send_reminder

  def send_reminder
    params = {
      title: title,
      status: status,
      type: remindable_type 
    }
    ActionCable.server.broadcast("remindchannel", params )
  end 
end
