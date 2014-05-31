class CreateConsoles < ActiveRecord::Migration
  def change
    create_table :consoles do |t|
      t.integer :gid
      t.string :console

      t.timestamps
    end
  end
end
