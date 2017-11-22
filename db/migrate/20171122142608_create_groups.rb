class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.integer :last_tid
      t.integer :global_tid
      t.string :name

      t.timestamps
    end
  end
end
