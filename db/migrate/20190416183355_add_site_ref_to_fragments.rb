class AddSiteRefToFragments < ActiveRecord::Migration[5.2]
  def change
    add_reference :fragments, :site, foreign_key: true
  end
end
