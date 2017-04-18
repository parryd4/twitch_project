class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.integer :viewers
      t.integer :channels
      t.timestamps
    end
  end
end
