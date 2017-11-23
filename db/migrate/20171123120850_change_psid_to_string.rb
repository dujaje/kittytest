class ChangePsidToString < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :last_psid, :string
    rename_column :users, :last_psid, :psid
    change_column :groups, :last_tid, :string
    rename_column :groups, :last_tid, :tid
  end
end
