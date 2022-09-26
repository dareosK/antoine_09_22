class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
  end

  def dashboard
    @user = current_user
    @projects = Writings.all.order(date: :desc)
    @writing = Writing.new
  end
end
