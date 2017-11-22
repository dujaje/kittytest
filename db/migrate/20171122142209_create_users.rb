class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :last_psid
      t.integer :fb_id
      t.string :first_name
      t.string :last_name
      t.string :profile_picture_url
      t.string :address
      t.integer :timezone

      t.timestamps
    end
  end
end
