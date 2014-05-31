class AddColToUser < ActiveRecord::Migration
  def change
    add_column :users, :access, :boolean
  end
end
