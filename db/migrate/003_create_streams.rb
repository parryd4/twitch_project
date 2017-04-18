class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.string :name
      t.integer :game_id
      t.integer :channel_id
      t.integer :viewers

      t.timestamps
    end
  end
end
