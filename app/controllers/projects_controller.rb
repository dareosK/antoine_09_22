class ProjectsController < ApplicationController
  skip_before_action :authenticate_user!, except: [:create, :edit, :update, :destroy]
  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def show
  end

  def create
    @project = Project.new(project_params)
    @project.user_id = current_user.id
    if @project.save!
    # no need for app/views/projects/create.html.erb
    redirect_to project_path(@project)
    else
      render "pages/dashboard", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @project.update(project_params)

    # no need for app/views/projects/update.html.erb
    redirect_to project_path(@project)
  end

  def destroy
    @project.destroy

    # no need for app/views/projects/destroy.html.erb
    redirect_to projects_path
  end

  private

  def find_project
    @project = Project.friendly.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title,
                                    :tagline,
                                    :artists,
                                    :institution_name,
                                    :project_type,
                                    :institution_address,
                                    :rich_body,
                                    :cover,
                                    :date,
                                    :end_date,
                                    photos: [])
  end
end
