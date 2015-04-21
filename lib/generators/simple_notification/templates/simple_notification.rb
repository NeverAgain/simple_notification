class SimpleNotification < ActiveRecord::Base
  belongs_to :owner, class_name: "User"
  belongs_to :recipient, class_name: "User"
  belongs_to :trackable, polymorphic: :true

end
