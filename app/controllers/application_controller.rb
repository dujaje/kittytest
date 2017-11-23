class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    return nil unless params[:user_id].present?
    User.find(params[:user_id])
  end

  def current_group
    return nil unless params[:user_id].present?
    Group.find(params[:group_id])
  end
end
