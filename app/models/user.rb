class User < ApplicationRecord
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :expenses
  has_many :splits
end
