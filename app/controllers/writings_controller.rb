class WritingsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @writings = Writing.all.order(date: :desc)
  end

  def create
    @writing = Writing.new(writing_params)
    @writing.user = current_user
    if @writing.save!
      redirect_to writing_path(@writing)
    else
      render :new
    end
  end

  private

  def writing_params
    params.require(:writing).permit(:title, :tagline, :date, :rich_body, :cover)
  end
end
