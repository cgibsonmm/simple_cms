class SectionsController < ApplicationController
  before_action :list_pages, only: [:new, :create, :edit, :update]

  layout 'admin'

  def index
    @sections = Section.all
  end

  def show
    @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
    @section.visable = true
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = "New section created"
      redirect_to(sections_path)
    else
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
    @section.visable = true
  end

  def update
    @section = Section.find(params[:id])
    if @section.update(section_params)
      flash[:notice] = "Section Update"
      redirect_to(section_path(@section))
    else
      flash[:notice] = 'Invalid Page ID'
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id])
    @section.destroy
    flash[:notice] = 'Section Deleted'
    redirect_to(sections_path)
  end

  private

  def section_params
    params.require(:section).permit(:page_id, :name, :visable,:position, :content_type, :content)
  end

  def list_pages
    @pages = Page.all
  end
end
