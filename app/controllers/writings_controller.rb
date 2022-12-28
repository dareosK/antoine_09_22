class WritingsController < ApplicationController
  skip_before_action :authenticate_user!

  def show
    @writing = Writing.find(params[:id])
    @quotes = User.find_by(admin: true).quotes
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

  def edit
    @writing = Writing.find(params[:id])
  end

  def update
    @writing = Writing.find(params[:id])
    @writing.update(writing_params)
    if @writing.save!
      redirect_to writing_path(@writing)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @writing = Writing.find(params[:id])
    @writing.destroy

    redirect_to dashboard_path
  end

  private

  def writing_params
    params.require(:writing).permit(:title, :tagline, :date, :rich_body, :cover)
  end
end
