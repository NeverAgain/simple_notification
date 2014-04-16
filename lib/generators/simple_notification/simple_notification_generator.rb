require 'rails/generators'
require 'rails/generators/migration'
require 'rails/generators/active_record'

class SimpleNotificationGenerator < Rails::Generators::Base
  source_root File.expand_path('../templates', __FILE__)
  include Rails::Generators::Migration

  def generate_migration
    migration_template "create_notifications.rb.erb", "db/migrate/create_notifications.rb"
  end

  def generate_model
    copy_file "notification.rb", "app/models/notification.rb"
  end

  def generate_controller
    copy_file "notifications_controller.rb", "app/controllers/notifications_controller.rb"
  end

  def generate_view
    empty_directory "app/views/notifications"
    copy_file "notifications_index.html.haml", "app/views/notifications/index.html.haml"
    copy_file "notifications_partial.html.haml", "app/views/notifications/_show.html.haml"
    copy_file "notifications_css.css.scss", "app/assets/stylesheets/notifications.css.scss"
  end

  private

  def self.next_migration_number( dirname )
    next_migration_number = current_migration_number(dirname) + 1
    if ActiveRecord::Base.timestamped_migrations
      [Time.now.utc.strftime("%Y%m%d%H%M%S%6N"), "%.20d" % next_migration_number].max
    else
      "%.3d" % next_migration_number
    end
  end
end

