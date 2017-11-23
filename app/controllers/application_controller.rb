class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    User.find(params[:user_id])
  end

  def current_group
    Group.find(params[:group_id])
  end
end
