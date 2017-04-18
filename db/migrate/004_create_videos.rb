class CreateVideos < ActiveRecord::Migration
  def change
      create_table :videos do |t|
        t.string  :title
        t.integer :game_id
        t.integer :channel_id
        t.integer :views
        t.integer :length
        t.timestamps
      end
  end
end
