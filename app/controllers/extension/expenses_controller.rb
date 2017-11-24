class Extension::ExpensesController < ApplicationController
  def new
    @expense = Expense.new
    @user = current_user
    @group = current_group
  end

  def create
  end

  def show
  end
end
