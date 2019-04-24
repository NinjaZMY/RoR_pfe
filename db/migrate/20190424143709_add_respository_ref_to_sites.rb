class AddRespositoryRefToSites < ActiveRecord::Migration[5.2]
  def change
    add_reference :sites, :respository, foreign_key: true
  end
end
