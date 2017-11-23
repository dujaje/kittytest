class Extension::PagesController < ApplicationController
  def redirect
  end

  def create_kitty
    @user = current_user
    @group = current_group

    puts @user
    puts @group
  end

  private
end
