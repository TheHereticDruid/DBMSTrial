class CreateFranchises < ActiveRecord::Migration
  def change
    create_table :franchises do |t|
      t.string :name
      t.string :franc

      t.timestamps
    end
  end
end
