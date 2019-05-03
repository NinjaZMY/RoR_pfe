class ChangeTimeToWatchDefault < ActiveRecord::Migration[5.2]
  def change
  change_column_default :sites, :time_to_watch,from:0,to:300
  end
end
