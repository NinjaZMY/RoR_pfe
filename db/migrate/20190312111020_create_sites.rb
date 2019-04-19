class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.string :nom
      t.string :url
      
      t.integer :time_to_watch ,              null: false, default: 0
      t.string :Respository ,              null: false, default: ""
      t.integer :Notification_Number
      

      t.timestamps


    end
  end
end
