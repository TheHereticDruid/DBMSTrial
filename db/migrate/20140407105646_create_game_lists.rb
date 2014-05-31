class CreateGameLists < ActiveRecord::Migration
  def change
    create_table :game_lists do |t|
      t.string :name
      t.string :dev
      t.string :pub
      t.string :esrb
      t.integer :crit
      t.date :yor

      t.timestamps
    end
  end
end
