class Extension::GroupsController < ApplicationController
  def show
    @user = User.find(params[:user_id])
    @group = Group.find(params[:group_id])
    @group.kitty_created = true
    @group.save
  end

  def update
    @user = User.find(params[:group][:user_id])
    @group = Group.find(params[:group][:group_id])
    @group.name = params[:group][:name]
    @group.save
    redirect_to extension_group_path(@group, user_id: @user.id, group_id: @group.id)
  end
end
