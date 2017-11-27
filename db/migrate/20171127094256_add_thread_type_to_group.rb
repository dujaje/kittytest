class AddThreadTypeToGroup < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :thread_type, :string
  end
end
