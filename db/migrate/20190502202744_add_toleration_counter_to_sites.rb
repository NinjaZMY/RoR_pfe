class AddTolerationCounterToSites < ActiveRecord::Migration[5.2]
  def change
    add_column :sites, :TolerationCounter, :integer , :default => 0 , :null => false
  end
end
