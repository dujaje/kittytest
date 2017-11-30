class Extension::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = User.all
    @expenses_paid = Expense.where(user_id: @user.id)
    @splits_owed = Split.where(user_id: @user.id)
    @transactions = []
    @expenses_paid.each do |expense|
      @transactions << expense
    end
    @splits_owed.each do |split|
      @transactions << split
    end
  end
end
