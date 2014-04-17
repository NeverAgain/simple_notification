module SimpleNotification
  module Methods
    def notify(recipient, trackable, message)
      owner = current_user
      owner = User.new if owner == nil

      if owner == recipient
        return
      end

      notification = Notification.create(owner_id: owner.id, recipient_id: recipient.id, message: message)
      trackable.notifications << notification
    end
  end
end

class << ActiveRecord::Base
  def can_be_tracked
    has_many :notifications, as: :trackable
  end
end
