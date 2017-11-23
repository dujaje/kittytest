class AddKittyCreatedToGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :kitty_created, :boolean, default: false
  end
end
