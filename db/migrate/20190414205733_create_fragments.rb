class CreateFragments < ActiveRecord::Migration[5.2]
  def change
    create_table :fragments do |t|
      t.integer :idSite
      t.integer :ordre
      t.integer :length
      t.text    :content

      t.timestamps

      add_foreign_key :fragment, :site, column: :idSite

    end
  end
end
