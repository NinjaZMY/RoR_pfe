class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.integer :number
      t.integer :day , null: false, default: 1

      t.timestamps
    end
  end
end
