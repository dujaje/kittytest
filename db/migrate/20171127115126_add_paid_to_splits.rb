class AddPaidToSplits < ActiveRecord::Migration[5.1]
  def change
    add_column :splits, :paid, :boolean, default: false
  end
end
