class AddColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :expenses, :description, :string, default: nil
  end
end
