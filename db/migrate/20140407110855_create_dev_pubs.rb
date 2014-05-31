class CreateDevPubs < ActiveRecord::Migration
  def change
    create_table :dev_pubs do |t|
      t.string :dev
      t.string :pub
      t.integer :collab

      t.timestamps
    end
  end
end
