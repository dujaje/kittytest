class Extension::PagesController < ApplicationController
  def home
  end

  def test
    @user = current_user
    @group = current_group

    puts @user
    puts @group
    binding.pry
  end

  private
end
