class Extension::ExpensesController < ApplicationController
  def new
    @expense = Expense.new
    @user = User.find(params[:user_id])
    @group = Group.find(params[:group_id])
  end

  def create
    @user_id = getparams[:user_id]
    @group_id = getparams[:group_id]
    @title = getparams[:title]
    @amount_cents = getparams[:amount_cents]
    @description = getparams[:description]
    @involved_group_string = getparams[:involved_group]
    @expense = Expense.create!(
      title: @title,
      description: @description,
      amount_cents: @amount_cents,
      user_id: @user_id,
      group_id: @group_id)
    equal_splitter(@expense, @involved_group_string)
    redirect_to extension_group_path(@group_id, user_id: @user_id, group_id: @group_id)
  end

  def show
    @expense = Expense.find(params[:id].to_i)
  end

  private

  def equal_splitter(expense, involved_group_string)
    involved_group = involved_group_string.split(",")
    number_involved = involved_group.length
    an_equal_split = expense.amount_cents.to_i / number_involved
    involved_group.each do |member_id|
      if member_id.to_i == expense.user.id
        next
      end
      split = Split.new(expense_id: expense.id, user_id: member_id, amount_cents: an_equal_split)
      split.save!
    end
  end

  def getparams
    params.require(:expense).permit(:id, :split_type, :location, :settle, :title, :amount_cents, :description, :user_id, :group_id, :involved_group)
  end

end
