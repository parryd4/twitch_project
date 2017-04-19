class CreateGames < ActiveRecord::Migration[4.2]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :viewers, :limit => 8
      t.integer :channels
      t.timestamps
    end
  end
end
