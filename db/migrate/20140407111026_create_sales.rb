class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :gid
      t.integer :price
      t.string :pub
      t.integer :sold
      t.boolean :stocked
      t.boolean :hardcopy

      t.timestamps
    end
  end
end
