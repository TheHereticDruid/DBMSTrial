class AddColsToUser < ActiveRecord::Migration
  def change
    add_column :users, :accessLevel, :string
  end
end
