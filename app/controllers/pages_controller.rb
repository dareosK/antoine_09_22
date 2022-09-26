class PagesController < ApplicationController
  skip_before_action :authenticate_user!, except: [:dashboard]

  def home
  end

  def dashboard
    @user = current_user
    @writings = Writing.all.order(date: :desc)
    @writing = Writing.new
  end
end
