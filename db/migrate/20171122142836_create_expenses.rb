class CreateExpenses < ActiveRecord::Migration[5.1]
  def change
    create_table :expenses do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.string :title
      t.integer :amount_cents, default: 0
      t.string :split_type, default: "equal"
      t.boolean :settled, default: false
      t.string :location

      t.timestamps
    end
  end
end
