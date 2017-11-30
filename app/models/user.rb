class User < ApplicationRecord
  has_many :memberships
  has_many :groups, through: :memberships
  has_many :expenses
  has_many :splits

  def outstanding_with_person_in_group(comparison_user, group)
    user_owed_splits = Split.joins(:expense).where(expenses: {user_id: self.id}).where(user_id: comparison_user.id).where(expenses: {group_id: group.id})
    user_owes_splits = Split.joins(:expense).where(expenses: {user_id: comparison_user.id}).where(user_id: self.id).where(expenses: {group_id: group.id})

    user_owes_total = 0
    user_owed_total = 0

    user_owed_splits.each do |split|
      user_owed_total += split.amount_cents
    end

    user_owes_splits.each do |split|
      user_owes_total += split.amount_cents
    end

    return user_owed_total - user_owes_total

  end

  def outstanding_with_person_overall(comparison_user)
    user_owed_splits = Split.joins(:expense).where(expenses: {user_id: self.id}).where(user_id: comparison_user.id)
    user_owes_splits = Split.joins(:expense).where(expenses: {user_id: comparison_user.id}).where(user_id: self.id)

    user_owes_total = 0
    user_owed_total = 0

    user_owed_splits.each do |split|
      user_owed_total += split.amount_cents
    end

    user_owes_splits.each do |split|
      user_owes_total += split.amount_cents
    end

    return user_owed_total - user_owes_total

  end
end
