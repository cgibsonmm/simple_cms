class PagesController < ApplicationController

  # performs before page load; set these in private method
  before_action :find_subjects, only: [:new, :create, :edit, :update]
  before_action :set_page_count, only: [:new, :create, :edit, :update]

  layout 'admin'
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
    @page_count = Page.count + 1
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:notice] = 'Page Created'
      redirect_to(pages_path)
    else
      flash[:notice] = 'Page not created due to error'
      @page_count = Page.count + 1
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
    @page.subject_id = 9
  end

  def update
    @page = Page.find(params[:id])
    if @page.update(page_params)
      flash[:notice] = 'Page updated'
      redirect_to(pages_path)
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = 'Page deleted'
    redirect_to(pages_path)
  end

  private

  def page_params
    params.require(:page).permit(:subject_id, :name, :permalink, :position, :visable)
  end

  def find_subjects
    @subjects = Subject.sorted
  end

  def set_page_count
    if params[:action] == 'new' || params[:action] == 'create'
      @page_count = Page.count + 1
    else
      @page_count = Page.count
    end
  end
end
