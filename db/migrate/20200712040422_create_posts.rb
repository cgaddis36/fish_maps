class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :city
      t.string :state
      t.string :body_of_water
      t.string :region
      t.string :privacy
      t.string :fly_or_conventional
      t.references :user, foreign_key: true

    end
  end
end
