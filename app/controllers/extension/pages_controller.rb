class Extension::PagesController < ApplicationController
  def redirect
  end

  def create_kitty
    @user = session[:current_user]
    @group = current_group
  end
end
