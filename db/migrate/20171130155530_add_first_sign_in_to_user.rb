class AddFirstSignInToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :first_sign_in, :boolean, default: true
  end
end
