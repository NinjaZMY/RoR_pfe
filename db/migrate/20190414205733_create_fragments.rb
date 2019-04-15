class CreateFragments < ActiveRecord::Migration[5.2]
  def change
    create_table :fragments do |t|
      t.integer :site_id
      t.integer :ordre
      t.integer :length
      t.text    :content

      t.timestamps

      add_foreign_key :fragments, :sites

    end
  end
end
