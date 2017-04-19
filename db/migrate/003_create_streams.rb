class CreateStreams < ActiveRecord::Migration[4.2]
  def change
    create_table :streams do |t|
      t.integer :stream_id
      t.string :stream_started
      t.string :status
      t.string :game_name
      t.string :channel_name
      t.integer :channel_id
      t.integer :viewers

      t.timestamps
    end
  end
end
