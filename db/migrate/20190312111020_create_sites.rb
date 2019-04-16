class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :nom
      t.string :url
      t.text :img
      t.integer :time_to_watch ,              null: false, default: 0
      t.string :Respository ,              null: false, default: ""
      t.integer :Notification_Number
      t.integer :user_id

      t.timestamps

      add_foreign_key :site, :user

    end
  end
end
