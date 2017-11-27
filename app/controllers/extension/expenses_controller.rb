class Extension::ExpensesController < ApplicationController
  def new
    @expense = Expense.new
    @user = User.find(params[:user_id])
    @group = Group.find(params[:group_id])
  end

  def create
  end

  def show
  end

  private

  def equal_splitter(expense, involved_group)
    number_involved = involved_group.length
    an_equal_split = expense.amount_cents.to_i / number_involved
    involved_group.each do |member|
      if member == creator
        next
      end
      split = Split.new(expense_id: expense, user_id: member, amount_cents: an_equal_split)
      split.save
    end
  end
end
