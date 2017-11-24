class Extension::GroupsController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @group = Group.find(params[:group_id])
  end
end
