class CreateChannels < ActiveRecord::Migration[4.2]
  def change
    create_table :channels do |t|
      t.string :title
      t.integer :views
      t.integer :followers
      t.timestamps
    end
  end
end
