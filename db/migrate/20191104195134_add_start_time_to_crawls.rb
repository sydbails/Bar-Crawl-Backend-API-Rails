class AddStartTimeToCrawls < ActiveRecord::Migration[6.0]
  def change
    add_column :crawls, :start_time, :datetime
  end
end
