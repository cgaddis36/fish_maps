class CreateFish < ActiveRecord::Migration[6.0]
  def change
    create_table :fish do |t|
      t.string :species
      t.float :length
      t.float :weight
      t.integer :quantity
      t.boolean :harvested
      t.string :photo

      t.timestamps
    end
  end
end
