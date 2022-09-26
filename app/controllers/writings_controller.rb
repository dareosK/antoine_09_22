class WritingsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @writings = Writing.all.order(date: :desc)
  end
end
