class Expense < ApplicationRecord
  belongs_to :group
  belongs_to :user
  has_many :splits
  has_many :payees, through: :splits, class_name: "User", foreign_key: :user_id
  validates :amount_cents, presence: true
  validates :title, presence: true
  validates :split_type, presence: true
  validates :amount_cents, numericality: { greater_than: 0 }
end
