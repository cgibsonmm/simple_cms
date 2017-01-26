class SubjectsController < ApplicationController
  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new(name: 'Name')
  end

  def create
    @subject = Subject.new(params[:subject])
    @subject.save ? redirect_to(subjects_path) : render('new')
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

end
