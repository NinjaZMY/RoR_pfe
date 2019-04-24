class CreateRespositories < ActiveRecord::Migration[5.2]
  def change
    create_table :respositories do |t|
      t.string :label

      t.timestamps
    end
  end
end
