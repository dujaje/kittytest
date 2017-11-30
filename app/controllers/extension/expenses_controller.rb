class Extension::ExpensesController < ApplicationController
  def new
    @expense = Expense.new
    @user = User.find(params[:user_id])
    @group = Group.find(params[:group_id])
  end

  def settle
    @expense = Expense.new
    @user = User.find(params[:user_id])
    @group = Group.find(params[:group_id])
    @to_pay = User.find(params[:to_pay_id])
  end

  def create
    @user = User.find(getparams[:user_id])
    @group = Group.find(getparams[:group_id])
    @title = getparams[:title]
    @to_pay = User.find(getparams[:to_pay_id])
    @amount_cents = getparams[:amount_cents].to_f * 100
    @description = getparams[:description]
    @involved_group_string = getparams[:involved_group]
    @location = getparams[:location]
    @expense = Expense.new(
      title: @title,
      description: @description,
      amount_cents: @amount_cents,
      user_id: @user.id,
      group_id: @group.id,
      location: @location)
    if @involved_group_string != "" && @involved_group_string != [@user.id.to_s] && @expense.save
      equal_splitter(@expense, @involved_group_string)
      redirect_to extension_expense_path(@expense, user_id: @user.id, group_id: @group.id)
    elsif @expense.description == "Settled"
      render :settle
    else
      render :new
    end
  end

  def show
    @expense = Expense.find(params[:id].to_i)
    @user = User.find(params[:user_id])
    @group = Group.find(params[:group_id])
  end

  private

  def equal_splitter(expense, involved_group_string)
    involved_group = involved_group_string.split(",")
    puts involved_group_string
    number_involved = involved_group.length
    puts number_involved
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
    params.require(:expense).permit(:id, :split_type, :location, :settle, :title, :amount_cents, :description, :user_id, :group_id, :involved_group, :to_pay_id)
  end

end
