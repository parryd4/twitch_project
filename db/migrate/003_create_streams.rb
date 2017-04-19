class CreateStreams < ActiveRecord::Migration[4.2]
  def change
    create_table :streams do |t|
      t.string :stream_id
      t.string :channel_name
      t.string :stream_started
      t.string :status
      t.string :game_name
      t.integer :viewers
      t.string :channel_id

      t.timestamps
    end
  end
end
