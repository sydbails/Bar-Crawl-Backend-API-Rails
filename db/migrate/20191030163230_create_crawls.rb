class CreateCrawls < ActiveRecord::Migration[6.0]
  def change
    create_table :crawls do |t|
      t.integer :user_id
      t.string :location_1
      t.string :location_2
      t.string :location_3

      t.timestamps
    end
  end
end
