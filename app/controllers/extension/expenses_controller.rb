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
    @expense = Expense.create!(
      title: @title,
      description: @description,
      amount_cents: @amount_cents,
      user_id: @user_id,
      group_id: @group_id)
    redirect_to extension_group_path(@group_id, user_id: @user_id, group_id: @group_id)
  end

  def show
    @user_id =
    @group_id
  end

  private

  def equal_splitter(expense, involved_group)
    number_involved = involved_group.length
    an_equal_split = expense.amount_cents.to_i / number_involved
    involved_group.each do |member|
      if member != creator
        Split.create!(expense_id: expense.id, user_id: member.id, amount_cents: an_equal_split)
      end
    end
  end

  def getparams
    params.require(:expense).permit(:title, :amount_cents, :description, :user_id, :group_id)
  end

end
