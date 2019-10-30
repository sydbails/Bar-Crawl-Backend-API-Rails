class CreateCrawlers < ActiveRecord::Migration[6.0]
  def change
    create_table :crawlers do |t|
      t.integer :user_id
      t.integer :crawl_id

      t.timestamps
    end
  end
end
