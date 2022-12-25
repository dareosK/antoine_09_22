class PagesController < ApplicationController
  skip_before_action :authenticate_user!, except: [:dashboard]

  def home
    @quotes = User.find_by(admin: true).quotes || "Make sure to add some funky quotes on your dashboard"
    # retrieve the random key from one of the moodboard pictures to showcase on the front page
    @image = User.find_by(admin: true).moodboard_attachments.sample.key || "https://source.unsplash.com/"
  end

  def works
    @works = Writing.all.order(date: :desc) + Project.all.order(:date)
    @quotes = User.find_by(admin: true).quotes
  end

  def dashboard
    @user = current_user
    @writings = Writing.all.order(date: :desc)
    @writing = Writing.new
    @projects = Project.all
    @project = Project.new
    @cv = User.find_by(admin: true).cv.key
  end

  def contact
    @quotes = User.find_by(admin: true).quotes
    @mail = User.find_by(admin: true).contact_mail
  end

  def about
    @bio = User.find_by(admin: true).bio
    @cv = User.find_by(admin: true).cv.key
    @avatar = User.find_by(admin: true).avatar.key
    @quotes = User.find_by(admin: true).quotes
  end
end
