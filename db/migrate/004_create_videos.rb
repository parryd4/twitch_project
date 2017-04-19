class CreateVideos < ActiveRecord::Migration[4.2]
  def change
      create_table :videos do |t|
        t.string  :title
        t.string :url
        t.integer :broadcast_id
        t.integer :channel_name
        t.string :video_creation
        t.string :broadcast_type
        t.string :language
        t.integer :views
        t.integer :length
        t.timestamps
      end
  end
end
