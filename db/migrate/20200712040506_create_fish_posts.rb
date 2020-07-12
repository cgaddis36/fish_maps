class CreateFishPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :fish_posts do |t|
      t.references :fish, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true

      t.timestamps
    end
  end
end
