class SubjectsController < ApplicationController
  before_action :count_subjects, only: [:new, :create, :edit, :update]

  layout 'admin'

  def index
    logger.debug('****** Testing the logger.******')
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)
    if @subject.save
      flash[:notice] = "Subject was created."
      redirect_to(subjects_path)
    else
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update(subject_params)
      flash[:notice] = "Subject was Updated."
      redirect_to(subject_path(@subject))
    else
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject was Deleted."
    redirect_to(subjects_path)
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible, :created_at)
  end

  def count_subjects
    if params[:action] == 'new' || params[:action] == 'create'
      @subject_count = Subject.count + 1
    else
      @subject_count = Subject.count
    end
  end
end
