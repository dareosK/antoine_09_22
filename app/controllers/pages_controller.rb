class PagesController < ApplicationController
  skip_before_action :authenticate_user!, except: [:dashboard]

  def home
    @quotes = User.first.quotes
  end

  def dashboard
    @user = current_user
    @writings = Writing.all.order(date: :desc)
    @writing = Writing.new
  end

  def contact
    @mail = User.find_by(admin: true).contact_mail
  end
end
