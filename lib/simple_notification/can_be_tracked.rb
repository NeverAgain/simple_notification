module SimpleNotification
  module Methods
    def notify(recipient, trackable, message)
      owner = current_user
      owner = User.new if owner == nil
      notification = Notification.create(owner_id: owner.id, recipient_id: recipient.id, message: message)
      trackable.notifications << notification
    end

    def show_with_read(notification)
      render "notifications/show", notification_id: notification.id, read: true
    end

    def show_without_read(notification)
      render "notifications/show", notification_id: notification.id, read: false
    end
  end
end

class << ActiveRecord::Base
  def can_be_tracked
    has_many :notifications, as: :trackable
  end
end
