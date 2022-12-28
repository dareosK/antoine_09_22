class PagesController < ApplicationController
  skip_before_action :authenticate_user!, except: [:dashboard]

  def home
    @quotes = User.find_by(admin: true).quotes || "Make sure to add some funky quotes on your dashboard"
    # retrieve the random key from one of the moodboard pictures to showcase on the front page
    @image = User.find_by(admin: true).moodboard_attachments.sample
  end

  def works
    @works = Writing.all.order(date: :desc) + Project.all.order(:date)
    @quotes = User.find_by(admin: true).quotes
  end

  def dashboard
    @user = current_user
    @avatar = User.find_by(admin: true).avatar.key
    @writings = Writing.all.order(date: :desc)
    @writing = Writing.new
    @projects = Project.all.order(date: :desc)
    @project = Project.new
    @cv = User.find_by(admin: true).cv.key
    @moodboard = User.find_by(admin: true).moodboard
  end

  def contact
    @quotes = User.find_by(admin: true).quotes
    @mail = User.find_by(admin: true).contact_mail
  end

  def about
    @bio = User.find_by(admin: true).rich_bio
    @cv = User.find_by(admin: true).cv.key
    @avatar = User.find_by(admin: true).avatar.key
    @quotes = User.find_by(admin: true).quotes
  end
end
