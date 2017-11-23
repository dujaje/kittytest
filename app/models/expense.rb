class Expense < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many :splits
  has_many :payees, through: :splits, class_name: "User", foreign_key: :user_id
end
