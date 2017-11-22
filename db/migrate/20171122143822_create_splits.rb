class CreateSplits < ActiveRecord::Migration[5.1]
  def change
    create_table :splits do |t|
      t.references :expense, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :amount_cents

      t.timestamps
    end
  end
end
