class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :nom
      t.string :url
      
      t.time :time_to_watch ,              null: false, default: 5.minute
      
      t.integer :Notification_Number
      t.integer :TolerationCounter , null: false ,default:0

      t.timestamps


    end
  end
end
