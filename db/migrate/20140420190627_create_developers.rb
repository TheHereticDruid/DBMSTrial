class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.string :name
      t.boolean :isIndie

      t.timestamps
    end
  end
end
