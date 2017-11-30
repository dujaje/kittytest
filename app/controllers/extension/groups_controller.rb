class Extension::GroupsController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @user.first_sign_in = false
    @group = Group.find(params[:group_id])
    @group.kitty_created = true
    @group.save
    @user_owes_splits_to_group = Split.joins(:expense).where(user_id: @user.id).where(expenses: {group_id: @group.id})
    @user_owed_splits_by_group = Split.joins(:expense).where(expenses: {user_id: @user.id}).where(expenses: {group_id: @group.id})
    @user_outstanding_with_group = outstanding_with_group(@user_owes_splits_to_group, @user_owed_splits_by_group)
  end

  def update
    @user = User.find(params[:group][:user_id])
    @group = Group.find(params[:group][:group_id])
    @group.name = params[:group][:name]
    @group.save
    redirect_to extension_group_path(@group, user_id: @user.id, group_id: @group.id)
  end

  private

  def outstanding_with_group(user_owes_splits, user_owed_splits)
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
