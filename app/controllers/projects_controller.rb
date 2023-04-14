class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @val = Project.new(process_params)
    if @val.save
      redirect_to projects_path
    else
      render :new
    end

  end

  def show
    @project = Project.find(params['id'])
  end

  def edit
    @project = Project.find(params['id'])
  end

  def update
    @project = Project.find(params['id'])
    @project.update(process_params)
    if @project.save
      redirect_to "/projects/#{params['id']}"
    else
      render :edit
    end
  end

  def destroy
    @project = Project.find(params['id'])
    @project.destroy
    @chk = Project.find_by(id: params['id'])
    if (!@chk.present?)
      redirect_to projects_path
    end
  end

  private

  def process_params
    params.require(:project).permit(:name)
  end
end