class CreateChannels < ActiveRecord::Migration[4.2]
  def change
    create_table :channels do |t|
      t.string :name
      t.string :channel_id
      t.string :channel_creation
      t.string :url
      t.boolean :mature
      t.boolean :partner
      t.string :videos_url
      t.string :teams
      t.string :language
      t.string :views
      t.string :followers

      t.timestamps
    end
  end
end
