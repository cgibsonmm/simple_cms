class PagesController < ApplicationController
  def index
    @pages = Page.all
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to(pages_path)
    else
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
      flash[:notice] = "Page updated"
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
end
