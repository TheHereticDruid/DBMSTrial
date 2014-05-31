class AddStuffToUser < ActiveRecord::Migration
  def change
    add_column :users, :accL, :integer
  end
end
