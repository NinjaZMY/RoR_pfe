class ChangeTimeToWatchDefault < ActiveRecord::Migration[5.2]
  def up
  change_column_default :sites, :time_to_watch,from:300,to:300
  change_column :sites, :time_to_watch, :integer
  end
  
  def down
  change_column_default :sites, :time_to_watch,from:300,to:0
  change_column :sites, :time_to_watch, :time
  end
end
