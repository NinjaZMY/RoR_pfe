class AddSiteRefToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_reference :notifications, :site, foreign_key: true
  end
end
