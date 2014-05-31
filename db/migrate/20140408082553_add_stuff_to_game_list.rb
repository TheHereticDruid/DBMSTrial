class AddStuffToGameList < ActiveRecord::Migration
  def change
    add_column :game_lists, :franchise, :string
  end
end
