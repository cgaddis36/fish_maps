class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :city
      t.string :state
      t.string :bio
      t.string :profile_pic

      t.timestamps
    end
  end
end
