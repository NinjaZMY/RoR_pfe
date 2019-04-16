class CreateFragments < ActiveRecord::Migration[5.2]
  def change
    create_table :fragments do |t|
      
      t.integer :ordre
      t.integer :length
      t.text    :content

      t.timestamps


    end
  end
end
