class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :username
      t.string :city
      t.string :state
      t.string :bio
      t.string :profile_pic
      t.string :google_token
      t.string :uid

      t.timestamps
    end
  end
end
