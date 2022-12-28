class ProjectsController < ApplicationController
  def show
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save!
    # no need for app/views/projects/create.html.erb
    redirect_to project_path(@project)
    else
      render "pages/dashboard"
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)

    # no need for app/views/projects/update.html.erb
    redirect_to project_path(@project)
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    # no need for app/views/projects/destroy.html.erb
    redirect_to projects_path
  end

  private

  # def find_project
  #   @project = Project.find(params[:id])
  # end

  def project_params
    params.require(:project).permit(:title,
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
