class WritingsController < ApplicationController
  skip_before_action :authenticate_user!, except: [:create, :edit, :update, :destroy]
  before_action :find_writing, only: [:show, :edit, :update, :destroy]

  def show
    @quotes = User.find_by(admin: true).quotes
  end

  def create
    @writing = Writing.new(writing_params)
    @writing.user = current_user
    if @writing.save!
      redirect_to writing_path(@writing)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @writing.update(writing_params)
    if @writing.save!
      redirect_to writing_path(@writing)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @writing.destroy

    redirect_to dashboard_path
  end

  private

  def find_writing
    @writing = Writing.friendly.find(params[:id])
  end

  def writing_params
    params.require(:writing).permit(:title, :tagline, :date, :rich_body, :cover)
  end
end
