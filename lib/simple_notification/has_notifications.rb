class << ActiveRecord::Base
  def has_notifications
    has_many :own_notifications, class_name: "SimpleNotification", foreign_key: :owner_id
    has_many :received_notifications, class_name: "SimpleNotification", foreign_key: :recipient_id
  end
end
