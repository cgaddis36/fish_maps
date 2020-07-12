class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.string :city
      t.string :state
      t.string :body_of_water
      t.string :region
      t.integer :privacy, default: 0
      t.integer :fly_or_conventional
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
